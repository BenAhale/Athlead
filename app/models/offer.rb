class Offer < ApplicationRecord
  belongs_to :scout, class_name: 'User'
  belongs_to :athlete, class_name: 'User'
end
