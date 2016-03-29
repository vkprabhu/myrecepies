class Chef < ActiveRecord::Base
    has_many :recipes
    has_many :likes
    has_many :comments
    before_save { self.email = self.email.downcase }
    validates :chefname, presence: true, length: {minimum: 3 , maximum: 40 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    has_secure_password
    
end
