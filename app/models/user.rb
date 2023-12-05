class User < ApplicationRecord
  # enum read_status: { Nonlu: 'Nonlu', Lu: 'Lu' }
  has_many :reviews
  has_many :libraries
  has_many :books, through: :libraries
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
