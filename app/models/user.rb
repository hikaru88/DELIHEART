class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :surprises, dependent: :destroy
  has_many :surprise_favorites, dependent: :destroy
  has_many :favorites, through: :surprise_favorites, source: :surprise
  has_many :surprise_messages, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :order_messages, dependent: :destroy
  has_many :cancel_requests, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :notices, dependent: :destroy
  has_many :reviews
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  has_many :from_user, class_name: "Review", foreign_key: "from_user_id", dependent: :nullify
  has_many :to_user, class_name: "Review", foreign_key: "to_user_id", dependent: :destroy
  has_many :send_review, through: :to_user, source: :from_user
  has_many :receive_review, through: :from_user, source: :to_user

  attachment :profile_image
end
