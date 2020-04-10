class User < ApplicationRecord
  attr_accessor :password
  has_secure_password
  # validates :username, uniqueness: { case_sensitive: false }

  def authenticate(plaintext_password)
    if BCrypt::Password.new(self.password_digest) == plaintext_password
      self
    else
      false
    end
  end
end
