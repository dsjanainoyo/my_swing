class Event < ApplicationRecord
    has_one_attached :event_image
    
    has_many :reservations
    belongs_to :musician
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :event_genres
    has_many :genre_items, through: :event_genres, dependent: :destroy
    
    validates :name, presence: true
    validates :introduction, presence: true
    validates :datetime, presence: true
    validates :place, presence: true
    validates :price, presence: true
    validates :capacity, presence: true
    
    enum seating_status:{
        reservable: 0,
        slightly: 1,
        sold_out: 2
    }
    
    def favorite_by?(user)
        favorites.exists?(user_id: user.id)
    end
end
