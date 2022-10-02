class Event < ApplicationRecord
    has_one_attached :event_image
    
    has_many :reservations
    belongs_to :musician
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :event_genres
    has_many :genre_items, through: :event_genres, dependent: :destroy
    
    scope :active_musicians, -> { joins(:musician).where(musician: { is_deleted: false }) }
    
    validates :name, presence: true
    validates :introduction, presence: true
    validates :start_month, presence: true
    validates :start_day, presence: true
    validates :start_hour, presence: true
    validates :start_minutes, presence: true
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
    
    def datetime
        start_month.to_s + "月" + start_day.to_s + "日" + start_hour.to_s + "時" + start_minutes.to_s + "分"
    end
end
