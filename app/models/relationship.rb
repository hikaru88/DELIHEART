class Relationship < ApplicationRecord
  # foreign_keyのオプションが必要
  belongs_to :reviewer, class_name: "User", foreign_key: "passive_id"
  belongs_to :reviewed, class_name: "User", foreign_key: "active_id"

  enum status: {
	  フォロー: 0,
    ブロック: 1
  }
end
