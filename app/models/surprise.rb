class Surprise < ApplicationRecord
  has_one :order, dependent: :nullify
  has_many :surprise_favorites, dependent: :destroy
  has_many :surprise_messages, dependent: :destroy
  has_many :surprise_images, dependent: :destroy
  has_many :target_areas, dependent: :destroy

  belongs_to :user

  accepts_nested_attributes_for :target_areas, allow_destroy: true
  accepts_nested_attributes_for :surprise_images, allow_destroy: true
  attachment :main_image


  enum postage: {
    出品者負担: 0,
    購入者負担: 1
  }
end
