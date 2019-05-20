class Employee < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :policies

  validates :name, presence: true
  validates :email, uniqueness: true

  acts_as_nested_set
end
