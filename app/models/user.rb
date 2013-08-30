class User < ActiveRecord::Base
  has_many :posts
  validates_uniqueness_of :username, :message => "Username is already taken."

  # Errors

  def errors?
    self.errors.messages.any?
  end

  def log_username_error
    self.errors.add(:invalid_username, "Username not found, please signup!")
  end

  def log_password_error
     self.errors.add(:invalid_password, "Password did not match.")
  end

  def log_existing_username_error
    self.errors.add(:taken_username, "Username '#{self.username}' is taken.")
  end


 # Login
  def self.authenticate(user, given_password)
    user.check_password(given_password) unless user.invalid_username?
  end

  def invalid_username?
    log_username_error if User.find_by_username(self.username).nil?
  end

  def check_password(password)
    self.log_password_error if self.password != password
  end


# Signup
  def authenticate_new_user(params)
    self.check_existing_name #covered in AR uniqueness
    #password confirmation is more of a user-helper  - front ened JS
    self.check_password_confirmation(params[:password_confirmation])
  end

  def check_existing_name
    self.log_existing_username_error if User.where(:username => self.username).any?
  end

  def check_password_confirmation(confirmation)
    self.log_password_error if self.password != confirmation
  end

end
