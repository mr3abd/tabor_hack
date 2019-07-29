class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def self.find_for_database_authentication(warden_conditions)
        conditions = warden_conditions.dup
        if login = conditions.delete(:login)
          where(conditions.to_hash).where(['lower(email) = :value', { value: login.downcase }]).first
        elsif conditions.key?(:email)
          where(conditions.to_hash).first
        end
    end
    def self.authenticate(credentials)
      guest = find_for_database_authentication(credentials.except(:password))
      return guest if guest&.valid_password?(credentials[:password])
  
      false
    end
end
