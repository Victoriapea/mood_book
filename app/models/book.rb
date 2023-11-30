class Book < ApplicationRecord
  has_many :librairies

  enum mood: {
    happy: 'happy',
    sad: 'sad',
    motivating: 'motivating',
    # Ajoutez d'autres sentiments
  }

  include PgSearch::Model
  pg_search_scope :search_by_name_synopsis_author_and_mood,
    against: %i[name synopsis author mood],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
