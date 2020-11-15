class Offer < ApplicationRecord
  enum status: [:pending, :accepted, :declined]
  belongs_to :scout, class_name: 'User'
  belongs_to :athlete, class_name: 'User'
end
