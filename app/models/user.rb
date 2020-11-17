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

  scope :search_by_name, -> (name) { where('name ILIKE ?', "%#{name}%")}
  scope :filter_by_position, -> (position) { joins(:statistic).merge(Statistic.where('position LIKE ?', "#{position}"))}
  scope :filter_min_height, -> (minheight) { joins(:statistic).merge(Statistic.where('height > ?', "#{minheight}"))}
  scope :filter_max_height, -> (maxheight) {joins(:statistic).merge(Statistic.where('height < ?', "#{maxheight}"))}
  scope :filter_min_weight, -> (minweight) { joins(:statistic).merge(Statistic.where('weight > ?', "#{minweight}"))}
  scope :filter_max_weight, -> (maxweight) { joins(:statistic).merge(Statistic.where('weight < ?', "#{maxweight}"))}
  scope :filter_min_points, -> (minpoints) { joins(:statistic).merge(Statistic.where('points > ?', "#{minpoints}"))}
  scope :filter_max_points, -> (maxpoints) { joins(:statistic).merge(Statistic.where('points < ?', "#{maxpoints}"))}
  scope :filter_min_rebounds, -> (minrebounds) { joins(:statistic).merge(Statistic.where('rebounds > ?', "#{minrebounds}"))}
  scope :filter_max_rebounds, -> (maxrebounds) { joins(:statistic).merge(Statistic.where('rebounds < ?', "#{maxrebounds}"))}
  scope :filter_min_assists, -> (minassists) { joins(:statistic).merge(Statistic.where('assists > ?', "#{minassists}"))}
  scope :filter_max_assists, -> (maxassists) { joins(:statistic).merge(Statistic.where('assists < ?', "#{maxassists}"))}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end