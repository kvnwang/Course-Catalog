class User < ActiveRecord::Base
has_secure_password
  before_save { self.email = email.downcase }
  # before_save :create_remember_token
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
  # has_secure_password
  validates :password_confirmation, presence: true
  validates :password_digest, length: { minimum: 6 }

  has_many :enrollments


    # Returns the hash digest of the given string.
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  # private
  #
  #   def create_remember_token
  #     self.remember_token = SecureRandom.urlsafe_base64
  #   end
end
