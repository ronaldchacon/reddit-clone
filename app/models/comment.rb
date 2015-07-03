class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  acts_as_votable

  validates :body, presence: true

end
