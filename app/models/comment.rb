class Comment < ApplicationRecord
    belongs_to :event
    belongs_to :musician
    belongs_to :user
end
