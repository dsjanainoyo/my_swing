class EventGenre < ApplicationRecord
    belongs_to :event
    belongs_to :genre_item
end
