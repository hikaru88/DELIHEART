class ChatRoom < ApplicationRecord
  belongs_to :surprise
  belongs_to :user

  has_many :messages, dependent: :destroy
end
