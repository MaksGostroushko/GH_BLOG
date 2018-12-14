class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  has_ancestry

  validates :body, presence: true, length: { maximum: 150 }
end
