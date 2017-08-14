class Ability < ApplicationRecord
  belongs_to :item, optional: true
  has_many :monster_drop_abilities, dependent: :destroy

  before_save :generate_slug
end
