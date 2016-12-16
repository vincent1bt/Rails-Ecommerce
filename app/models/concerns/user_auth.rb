module UserAuth
  extend ActiveSupport::Concern

  included do
    attr_accessor :remember_token
    has_secure_password
  end

  module ClassMethods
    def secure_string(string)
      cost = BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def generate_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.generate_token
    puts "paso por aqui remember"
    update_attribute(:token_digest, User.secure_string(remember_token))
  end

  def authenticated?(remember_token)
    return false if token_digest.nil?
    BCrypt::Password.new(token_digest).is_password?(remember_token)
  end

  def delete_cookie
    update_attribute(:token_digest, nil)
  end

end
