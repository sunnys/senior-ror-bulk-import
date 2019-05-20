class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
