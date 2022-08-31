class UserGenre < ApplicationRecord
    belongs_to :user
    belongs_to :genre_item
end
