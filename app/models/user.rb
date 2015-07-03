class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
  EMAIL_FORMAT = /\A([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})\z/
  validates :email, presence: true, format: {with: EMAIL_FORMAT, message: "Invalid Email"}
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
