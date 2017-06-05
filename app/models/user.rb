class User < ApplicationRecord
  #password=(unencrypted virtual attribute)
  #validates presence of password, password_confirmation
  #authenticate(unentrypted password)
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase } 
  validates :name,     length: { maximum: 50 }, 
                       presence: true
  validates :email,    length: { maximum: 250 }, 
                       format: { with: VALID_EMAIL_REGEX },
                       uniqueness: { case_sensitive: false },
                       presence: true
  validates :password, length: { minimum: 6 },
                       presence: true

end

