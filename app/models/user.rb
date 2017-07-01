class User < ApplicationRecord
  # password=(unencrypted virtual attribute)
  # validates presence of password, password_confirmation
  # authenticate(unentrypted password)
  #
  # Much of the secure password machinery will be
  # implemented using a single Rails method called
  # has_secure_password. Because so much depends on
  # this one method, it is difficult to develop
  # secure passwords incrementally
  #
  # 1. need bcrypt, and password_digest on model
  # 2. password & password_confirmation are virtual
  #    attrs that must match. all taken care of by 
  #    has_secure_password
  # 3. presence validations auto added too
  # 4. as long as there is a password_digest column
  #    in the database, adding this one method to our
  #    model gives us a secure way to create and
  #    authenticate new users
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

