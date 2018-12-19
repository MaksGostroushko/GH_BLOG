class Comment < ApplicationRecord
  has_ancestry

  belongs_to :user
  belongs_to :micropost

  has_many :likes, dependent: :destroy

  validates :body, presence: true, length: { maximum: 300 }
  default_scope { order( created_at: :asc )}
end
