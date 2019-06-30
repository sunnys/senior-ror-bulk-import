class CreateEmpTempStorageErrors < ActiveRecord::Migration[5.2]
  def change
    create_table :emp_temp_storage_errors do |t|
      t.integer :bulk_employee_upload_id
      t.string :data
      t.string :upload_errors

      t.timestamps
    end
  end
end
