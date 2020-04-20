class SurpriseImage < ApplicationRecord
  belongs_to :surprise

  attachment :image
end
