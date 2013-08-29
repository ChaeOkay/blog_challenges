class User < ActiveRecord::Base
  has_many :posts
  validates_uniqueness_of :username

  def log_username_error
    self.errors.add(:invalid_username, "Username does not exist yet, please signup!")
  end

  def log_password_error
     self.errors.add(:invalid_password, "Password and password confirmation did not match.")
  end

end
