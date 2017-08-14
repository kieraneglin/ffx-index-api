class Monster < ApplicationRecord
  has_and_belongs_to_many :locations
  has_many :kill_drops, dependent: :destroy
  has_many :kill_dropped_items, through: :kill_drops, source: :item
  has_many :steal_drops
  has_many :steal_dropped_items, through: :steal_drops, source: :item

  # This references the weapons and armour
  has_many :monster_drop_abilities
  has_many :drop_abilities, through: :monster_drop_abilities, source: :ability

  has_one :bribe_drop
  has_many :bribe_dropped_item, through: :bribe_drop, source: :item

  has_one :element

  before_save :generate_slug
end
