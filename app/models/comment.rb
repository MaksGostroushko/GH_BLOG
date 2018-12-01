class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :microposts

  validates :body, presence: true, allow_blank: false
  #allow_blank check that field don't empty
end
