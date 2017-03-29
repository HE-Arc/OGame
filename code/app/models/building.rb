class Building < ApplicationRecord
  has_and_belongs_to_many :planet
end
