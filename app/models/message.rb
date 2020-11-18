class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :content, presence: true, length: { minimum: 0, maximum: 255 }
end
