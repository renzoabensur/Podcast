# require 'bcrypt'
class User < ApplicationRecord
    # include bcrypt
    has_secure_password

    has_many :podcastscrappings, dependent: :destroy

    validates :password, presence: true, length: { minimum: 6 }
end
