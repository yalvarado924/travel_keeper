class User < ActiveRecord::Base
    has_secure_password
    has_many :destinations
    validates :username, presence:true, uniqueness:true
end