class CreateJoinTableEmployeePolicy < ActiveRecord::Migration[5.2]
  def change
    create_join_table :employees, :policies do |t|
      t.index [:employee_id, :policy_id]
      t.index [:policy_id, :employee_id]
    end
  end
end
