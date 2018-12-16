class Micropost < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  scope :views, -> { reorder(views_count: :desc) }
  scope :down_views, ->  { reorder(views_count: :asc) }
  scope :desc, -> { order(created_at: :desc) }
  scope :asc, -> { reorder(:created_at) }
  scope :votes, -> { reorder(likes_count: :asc) }
  scope :down_votes, -> { reorder(likes_count: :desc) }
  scope :published, -> { where(published: true) }

  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :content, presence: true, length: { minimum: 25,  maximum: 10000 }
  validate  :picture_size

  mount_uploader :picture, PictureUploader

  def user_like(user)
    likes.find_by(user: user)
  end

  def all_tags
  self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(', ').map do |name|
    Tag.where(name: name.strip).first_or_create!
    end
  end

  def self.search(search)
    where(("title ILIKE ?"), "%#{search}%")
  end

  private
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
