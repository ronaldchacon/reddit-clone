class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  acts_as_votable

  default_scope -> { order(created_at: :desc) }
end
