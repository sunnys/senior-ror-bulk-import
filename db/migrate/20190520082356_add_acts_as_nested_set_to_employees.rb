# frozen_string_literal: true

class AddActsAsNestedSetToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column(:employees, :parent_id, :integer, null: true, index: true)
    add_column(:employees, :lft, :integer, null: false, index: true, default: 0)
    add_column(:employees, :rgt, :integer, null: false, index: true, default: 0)

    add_column(:employees, :depth, :integer, null: false, default: 0)
    add_column(:employees, :children_count, :integer, null: false, default: 0)
  end
end
