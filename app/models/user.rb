class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets
  validates :username, presence: true
  validates :email, presence: true

  def slug
    self.username.downcase.gsub(" ", "-")
  end
end