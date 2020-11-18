class Offer < ApplicationRecord
  enum status: [:pending, :accepted, :declined]
  belongs_to :scout, class_name: 'User'
  belongs_to :athlete, class_name: 'User'

  validates :status, presence: true, inclusion: { in: ["pending", "accepted", "declined"],
    message: "%{value} is not a valid status!" }
end
