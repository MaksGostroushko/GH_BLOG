class Micropost < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  scope :views, -> { reorder(views_count: :desc) }
  scope :desc, -> { order(created_at: :desc) }
  scope :asc, -> { reorder(:created_at) }
  scope :votes, -> { reorder(likes_count: :desc) }
  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :content, presence: true, length: { minimum: 25,  maximum: 10000 }
  validate  :picture_size

  mount_uploader :picture, PictureUploader

  def user_like
    likes.find_by(user: user)
  end

  private
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
