class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true
  validates :value, presence: true
  validates_inclusion_of :value, :in => [-1, 1]
  validates_uniqueness_of :user_id, scope: :review_id

  after_save :update_review_popularity

  def update_review_popularity
    self.review.calculate_popularity
  end
end
