class Musician < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :musician_image
  
  has_many :relationships, class_name: "Relationship",foreign_key: "followed_id",dependent: :destroy
  has_many :followers, through: :relationships
  
  has_many :favorites, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_many :musician_genres
  has_many :genre_items, through: :musician_genres, dependent: :destroy
  has_many :users, through: :relationships, dependent: :destroy
  

  validates :name, presence: true
  
  enum is_deleted:{
    validity: false,
    withdrawal: true
  }
end
