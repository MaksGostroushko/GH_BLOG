class Like < ApplicationRecord
  belongs_to :micropost, counter_cache: true, optional: true
  belongs_to :user
  belongs_to :comment, counter_cache: true, optional: true

end
