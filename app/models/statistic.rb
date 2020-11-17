class Statistic < ApplicationRecord
  belongs_to :user

  scope :search_by_position, -> (position) { where('position LIKE ?', "#{position}")}
end
