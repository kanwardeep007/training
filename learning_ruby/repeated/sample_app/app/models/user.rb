class User < ApplicationRecord
  attr_accessor :remember_token 
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length:{maximum: 255},uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX}
  has_secure_password
  validates :password, presence: true , length: {minimum: 6},allow_nil: true
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #gives the digest of the string
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  #remembers the token with the user and saves the digest in the database
  def remember
    self.remember_token = User.new_token
    self.update_attribute(:remember_digest, User.digest(self.remember_token))
  end

  #returns true if the digest matches the remember token
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  def forget
    update_attribute(:remember_digest, nil)
  end
  def current_user?(user)
    return current_user == user ? true : false
    
  end
end
