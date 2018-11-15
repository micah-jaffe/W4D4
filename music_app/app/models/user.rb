class User < ApplicationRecord
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, presence: true, length: { minimum: 6, allow_nil: true }
  
  before_validation :ensure_session_token
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end
  
  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.has_password?(password) ? user : nil
  end
  
  attr_reader :password
  
  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end
  
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def has_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
