class Message < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true
    validates :content, presence: true, length: {in: 1..500, too_long: "1~ 500文字まで入力できます"}
end
