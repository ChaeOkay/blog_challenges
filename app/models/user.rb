class User < ActiveRecord::Base
  has_many :posts

  def log_username_error
    errors.add(:username_error, "Username is taken! Please signin or select another username")
  end

  def log_password_error
     errors.add(:password_error, "Password and password confirmation did not match")
  end

end
