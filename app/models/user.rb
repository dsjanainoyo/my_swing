class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :user_image
  
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id",dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :favorites, dependent: :destroy
  has_many :events, through: :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reservations
  has_many :user_genres
  has_many :genre_items, through: :user_genres, dependent: :destroy
  has_many :musicians, through: :relationships, dependent: :destroy
  
  enum is_deleted:{
    validity: false,
    withdrawal: true
  }
  
  def follow(musician_id)
    relationships.create(followed_id: musician_id)
  end
  
  def unfollow(musician_id)
    relationships.find_by(followed_id: musician_id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
end
