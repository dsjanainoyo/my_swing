class Comment < ApplicationRecord
    belongs_to :event
    belongs_to :musician, optional: true
    belongs_to :user, optional: true
    
    validates :comment, presence: true
end
