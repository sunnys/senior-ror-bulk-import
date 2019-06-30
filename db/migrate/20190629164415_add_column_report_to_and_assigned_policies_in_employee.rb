class AddColumnReportToAndAssignedPoliciesInEmployee < ActiveRecord::Migration[5.2]
  def change
    # add_column :employees, :report_to, :string
    # add_column :employees, :assigned_policies, :string
    add_column :employees, :bulk_employee_upload_id, :integer
  end
end
