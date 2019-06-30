class BulkEmployeeUpload < ApplicationRecord
    mount_uploader :file, BulkEmployeeFileUploader
    belongs_to :company
    validates_with EmployeeCsvValidator

    after_create :start_create_employee_job

    def start_create_employee_job
        CreateEmployeeJob.perform_later(self)

        # Employee.transaction do
        #     require 'csv'
        #     records = CSV.read(self.file.path).drop(1).map{ |i| i << self.company_id; i << self.id }
        #     columns = [:name, :email, :phone, :report_to, :assigned_policies, :company_id, :bulk_employee_upload_id]
        #     Employee.import columns, records, batch_size: 50000, on_duplicate_key_ignore: true, validate: true
        # end
        # Employee.rebuild!
        # Employee.where(bulk_employee_upload_id: self.id).map(&:assign_parent_and_policies)
        
    end

    def to_csv
        require 'csv'
        CSV.generate(headers: true) do |csv|
            attributes = ["Employee Name", "Email", "Phone", "Report To", "Assigned Policies"]
            upload_errors = EmpTempStorageError.where(bulk_employee_upload_id: self.id).map{|i| JSON.parse(i.data).with_indifferent_access }
            csv << attributes
            upload_errors.each do |car|
                csv << attributes.map{|i| i.parameterize.underscore}.map{ |attr| car[attr] }
            end
        end
    end
end
