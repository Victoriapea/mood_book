class Mood < ApplicationRecord
  has_many :books

  validates :name, presence: true
  validates :image, presence: true
end
