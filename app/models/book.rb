class Book < ApplicationRecord
  has_many :librairies

  include PgSearch::Model
  pg_search_scope :search_by_name_synopsis_author_and_mood,
    against: [:name, :synopsis, :author, :mood],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
