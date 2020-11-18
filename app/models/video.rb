class Video < ApplicationRecord
  belongs_to :user
  validates :link, presence: true, length: { minimum: 10, maximum: 255 }
end
