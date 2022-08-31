class MusicianGenre < ApplicationRecord
    belongs_to :musician
    belongs_to :genre_item
end
