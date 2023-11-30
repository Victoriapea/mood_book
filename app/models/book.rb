class Book < ApplicationRecord
  has_many :libraries

  def self.find_books_by_category(category)
    where(category: category)
  end

  enum mood: { happy: 'happy', sad: 'sad', excited: 'excited', calm: 'calm', serious: 'serious' }

  include PgSearch::Model
  pg_search_scope :search_by_name_synopsis_author_and_mood,
    against: %i[name synopsis author mood],
    using: {
      tsearch: { prefix: true }
    }

  def published_date
    # Remplacez 'published_date' par le nom correct de votre colonne
    self[:published_date]
  end
  def page_count
    # Remplacez 'page_count' par le nom correct de votre colonne
    self[:page_count]
  end
  def preview_link
    # Remplacez 'preview_link' par le nom correct de votre colonne
    self[:preview_link]
  end
end
