class Micropost < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  scope :views, -> { order(:views_count) }
  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  validates :title, presence: true, length: { minimum: 3 }
  validates :content, presence: true, length: { maximum: 200 }
  validate  :picture_size

  mount_uploader :picture, PictureUploader

  private
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
