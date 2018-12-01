class Picture < ApplicationRecord
  mount_uplodaer :image, ImageUploader
end
