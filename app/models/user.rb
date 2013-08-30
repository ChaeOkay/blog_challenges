class User < ActiveRecord::Base
  has_many :posts
  validates_uniqueness_of :username, :message => "Username is already taken."
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
        :message => "Please enter a valid email address." }

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

end
