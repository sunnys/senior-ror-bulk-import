class Policy < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :employees

  validates :name, uniqueness: true
end
