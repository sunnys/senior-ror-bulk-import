class AddColumnStateToBulkEmployeeUpload < ActiveRecord::Migration[5.2]
  def change
    add_column :bulk_employee_uploads, :status, :string, default: "Processing"
  end
end
