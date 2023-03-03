class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :garages, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true, length: { minimum: 2 }
end
