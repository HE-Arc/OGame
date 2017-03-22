class User < ApplicationRecord
  has_secure_password
  has_many :planets
  has_one :planet

  has_and_belongs_to_many :technologies
end
