class Planet < ApplicationRecord
  has_many :buildings
  has_many :defenses
  has_many :spaceships
  belongs_to :user, optional: true
  belongs_to :solarsystem
end
