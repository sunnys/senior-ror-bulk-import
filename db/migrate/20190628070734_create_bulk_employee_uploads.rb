class CreateBulkEmployeeUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :bulk_employee_uploads do |t|
      t.string :file
      t.integer :company_id
      t.timestamps
    end
  end
end
