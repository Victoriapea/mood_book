class Book < ApplicationRecord
  has_many :reviews
  has_many :libraries
  has_many :users, through: :libraries
  belongs_to :mood
  attribute :rating, :integer

  def self.find_books_by_category(category)
    where(category: category)
  end

  enum mood: { happy: 'happy', sad: 'sad', excited: 'excited', calm: 'calm', serious: 'serious', angry: 'angry' }

  include PgSearch::Model
  pg_search_scope :search_by_name_synopsis_author_and_mood,
    against: %i[name synopsis author mood],
    using: {
      tsearch: { prefix: true }
    }

  def read
    read_attribute(:read)
  end
end
