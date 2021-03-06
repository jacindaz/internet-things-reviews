class Meme < ActiveRecord::Base
  mount_uploader :picture, MemePictureUploader

  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :url, presence: true

  def update_average_rating
    self.update(average_rating: self.reviews.average(:rating).round(1))
  end

  def self.search(query)
    where('name ILIKE ?', "%#{query}%")
  end

  def has_review_from?(user)
    reviews.find_by(user_id: user.id).present?
  end
end
