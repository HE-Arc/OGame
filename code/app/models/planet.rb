class Planet < ApplicationRecord
  has_many :buildings, :defenses, :spaceships
  belongs_to :user, :solarsystem
end
