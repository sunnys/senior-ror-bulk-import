class AddIndexEmployee < ActiveRecord::Migration[5.2]
  def change
    add_index(:employees, :email)
    add_index(:policies, :name)
  end
end
