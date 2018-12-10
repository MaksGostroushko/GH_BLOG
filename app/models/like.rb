class Like < ApplicationRecord
  belongs_to :micropost, counter_cache: true
  belongs_to :user

  validates :user, uniqueness: true
end
