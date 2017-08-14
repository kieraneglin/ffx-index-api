class Location < ApplicationRecord
  has_and_belongs_to_many :monsters
  has_many :key_items

  before_save :generate_slug
end
