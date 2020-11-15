class Conversation < ApplicationRecord
  belongs_to :scout, class_name: 'User'
  belongs_to :athlete, class_name: 'User'
  has_many :messages
end
