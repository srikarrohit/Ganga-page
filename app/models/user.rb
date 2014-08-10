class User < ActiveRecord::Base

  has_many :posts, inverse_of: :user, dependent: :destroy
  has_many :comments, inverse_of: :user, dependent: :destroy
  has_many :notifications, inverse_of: :user, dependent: :destroy
  has_many :follows
  has_many :posts, through: :follows
  has_many :angers
  has_many :posts, through: :angers

  before_create :create_remember_token
  before_save {self.username = username.upcase }

  has_secure_password

  validates :fullname, presence: true, length: {maximum: 50}
#  validates :password, length: { minimum:6 }
#  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :username, presence: true, length: {is: 8}
  validates :notifications_count, presence: true

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
