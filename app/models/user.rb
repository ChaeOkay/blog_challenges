class User < ActiveRecord::Base
  has_many :posts

  def log_username_error
    self.errors.add(:username_error, "Username does not exist yet, please signup!")
  end

  def log_password_error
     self.errors.add(:password_error, "Password and password confirmation did not match.")
  end

end
