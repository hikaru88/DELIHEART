class Surprise < ApplicationRecord
  has_one :order, dependent: :nullify
  has_many :surprise_favorites, dependent: :destroy
  has_many :surprise_messages, dependent: :destroy
  has_many :surprise_images, dependent: :destroy
  has_many :target_areas, dependent: :destroy

  belongs_to :user

  accepts_nested_attributes_for :target_areas, allow_destroy: true
  attachment :main_image

  def days
    "#{self.year}年 / #{self.month}月 / #{self.day}日"
  end

  enum postage: {
    出品者負担: 0,
    購入者負担: 1
  }
end
