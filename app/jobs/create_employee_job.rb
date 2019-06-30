class CreateEmployeeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    upload_file = args[0]
    records = get_data(upload_file)
    created = 0
    errored = 0
    message = {"total": records.count, "created": 0, "errored": 0}
    records.each do |record|
      begin
        errors = []
        e = Employee.upsert_employee_and_manager(record, upload_file)
        if e
          created = created + 1
          message["created"] = created
        end
      rescue Exception => ex
        errors << ex.message.to_json
      end
      if errors.present?
        errored = errored + 1
        message["errored"] = errored
        EmpTempStorageError.create!(bulk_employee_upload_id: upload_file.id, data: record.to_json, upload_errors: errors)
      end
      ActionCable.server.broadcast "uploads:#{ upload_file.id }:status", message: message
    end
    upload_file.status = "completed"
    upload_file.save!
  end
  
  private
  def get_data(bulk_data_csv)
    require 'csv'
    data = CSV.read(bulk_data_csv.file.path, :headers => :first_row, :header_converters => :symbol).map(&:to_h)
    return data
  end
end
