class Reservation < ApplicationRecord
    belongs_to :event
    belongs_to :user
    
    validates :headcount, presence: true
end
