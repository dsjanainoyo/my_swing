class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :user_image
  
  has_many :relationships
  has_many :favorites
  has_many :comments
  has_many :reservations
  has_many :user_genres
  has_many :genre_items, through: :user_genres, dependent: :destroy
  
  enum is_deleted:{
    validity: true,
    withdrawal: false
  }
end
