class GenreItem < ApplicationRecord
    has_many :musician_genres
    has_many :musicians, through: :musician_genres, dependent: :destroy
end
