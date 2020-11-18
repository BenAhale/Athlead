class Statistic < ApplicationRecord
  belongs_to :user

  validates :position, presence: true, inclusion: { in: ["Point Guard", "Shooting Guard", "Small Forward", "Power Forward", "Center"],
    message: "%{value} is not a valid position!" }
  validates :height, presence: true, numericality: true
  validates :weight, presence: true, numericality: true
  validates :points, presence: true, numericality: true
  validates :rebounds, presence: true, numericality: true
  validates :assists, presence: true, numericality: true
  validates :blocks, presence: true, numericality: true
  validates :steals, presence: true, numericality: true
end
