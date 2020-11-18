class Address < ApplicationRecord
  has_one :user
  has_one :school

  validates :street, length: { minimum: 10, maximum: 255 }
  validates :city, length: { minimum: 10, maximum: 255 }
  validates :state, length: { minimum: 10, maximum: 255 }
  validates :postcode, numericality: true
  validates :country, length: { minimum: 10, maximum: 255 }
end
