class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :surprises, dependent: :destroy
  has_many :surprise_favorites, dependent: :destroy
  has_many :favorites, through: :surprise_favorites, source: :surprise
  has_many :orders, dependent: :destroy
  has_many :order_messages, dependent: :destroy
  has_many :cancel_requests, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :notices, dependent: :destroy
  has_many :reviews

    # followerと言う仮想モデルを指定。オプションでforeign_key: "followed_id"を指定することで、
    # user.follower
    # と言う記述が可能になる。
    # 上の記述をした時、Relationshipテーブルのfollowed_idにuserのidが入っているレコードを取得できる。

  has_many :follower, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

    # following_userと言う仮想モデルを指定。オプションでthrough: :followedとしているが、ここのfollowedは
    # 上で関連付けした仮想モデル has_many :followedのことを指す。
    # through: followed, source: :followedと記述すると、user.following_userと記述した際に、
    # 仮想モデルfollowed(Relationship)を飛ばして、userに紐づいた仮想モデルfollowed(User)を直接取得することができる。
    # つまり、follower_idにuserのidが入っているrelationshipテーブルのレコードのfollowed_idのidを持つuserのレコードを直接取得できる。
    # 例)
    # relationship
    # id: 1, follower_id: 1, followed_id: 3
    # id: 1, follower_id: 1, followed_id: 5

    # user = User.find(1)
    # user.following_user
    # => User(id: 3)
    #    User(id: 5)

  has_many :following_user, through: :followed, source: :followed
  has_many :follower_user, through: :follower, source: :follower
  # has_many :send_review, class_name: "Review", foreign_key: "from_user_id", dependent: :nullify
  has_many :send_review, class_name: "Review", foreign_key: "from_user_id", dependent: :nullify
  has_many :receive_review, class_name: "Review", foreign_key: "to_user_id", dependent: :destroy
  # has_many :send_review, through: :to_user, source: :from_user
  # has_many :receive_review, through: :to_user, source: :to_user

  accepts_nested_attributes_for :addresses, allow_destroy: true

  attachment :profile_image

  def is_follow?(user)
    follower.find_by(follower_id: user.id).present?
  end

end
