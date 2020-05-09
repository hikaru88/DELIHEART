class Order < ApplicationRecord
  belongs_to :surprise
  belongs_to :user

  has_many :order_messages, dependent: :destroy
  has_many :cancel_requests, dependent: :destroy

  attachment :surprise_image

  enum status: {
	  入金待ち: 0,
    発送待ち（サプライズ準備中）: 1,
    配達中（サプライズ実施前）: 2,
    購入者、レビュー済: 3,
    取引完了: 4
  }

  enum payment_method: {
    銀行振込: 0,
    クレジットカード: 1
  }
end