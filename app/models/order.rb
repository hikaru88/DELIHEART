class Order < ApplicationRecord
  belongs_to :surprise
  belongs_to :user

  has_many :order_messages, dependent: :destroy
  has_many :cancel_requests, dependent: :destroy
end