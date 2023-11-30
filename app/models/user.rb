class User < ApplicationRecord
  # enum read_status: { Nonlu: 'Nonlu', Lu: 'Lu' }

  has_many :librairies
  has_many :books, through: :librairies
  has_one :questionnaire
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
