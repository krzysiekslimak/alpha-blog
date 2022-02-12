class Users < ApplicationRecord
    validates :username, presence: true,
                        length: {minimum: 3, maximum: 100},
                        uniqueness: { case_sensitive: false }
    EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i               
    validates :email, presence: true,
                        length: {minimum: 5, maximum: 100},
                        format: {with: EMAIL_REGEX}
end