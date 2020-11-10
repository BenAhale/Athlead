class User < ApplicationRecord
  enum role: [:athlete, :scout]
  has_one :trait
  belongs_to :address, optional: true
  has_one :school
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end