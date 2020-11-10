class School < ApplicationRecord
  belongs_to :address
  belongs_to :user
  accepts_nested_attributes_for :address
end
