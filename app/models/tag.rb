class Tag < ApplicationRecord

  has_many:taggings
  has_many:microposts, through: :taggings

end
