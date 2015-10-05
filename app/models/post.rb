class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_votable

  validates :title, presence: true
  URL_FORMAT = /\A(https?:\/\/)([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/
  validates :url, presence: true, format: {with: URL_FORMAT, message: 'Invalid URL'}

  default_scope -> { order(cached_votes_score: :desc) }
end
