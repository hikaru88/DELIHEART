class Relationship < ApplicationRecord
  # foreign_keyのオプションが必要
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
