class SurpriseFavorite < ApplicationRecord
  belongs_to :surprise
  belongs_to :user
end
