class User < ApplicationRecord
  enum role: [:athlete, :scout]
  belongs_to :address, optional: true
  has_one :school
  has_one :statistic
  has_one_attached :avatar
  has_many :videos
  has_many :received_offers, class_name: 'Offer', foreign_key: 'athlete_id'
  has_many :sent_offers, class_name: 'Offer', foreign_key: 'scout_id'
  has_many :conversations, class_name: 'Conversation', foreign_key: 'athlete_id'
  has_many :started_conversations, class_name: 'Conversation', foreign_key: 'scout_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end