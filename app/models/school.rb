class School < ApplicationRecord
  belongs_to :address
  belongs_to :user
  accepts_nested_attributes_for :address

  validates :name, presence: true, length: { minimum: 10, maximum: 255 }
  validates :division, presence: true, numericality: true
end
