class Musician < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :musician_image
  
  has_many :relationships
  has_many :favorites
  has_many :events
  has_many :comments
  has_many :musician_genres
  has_many :genre_items, through: :musician_genres, dependent: :destroy
  
  enum is_deleted:{
    validity: false,
    withdrawal: true
  }
end
