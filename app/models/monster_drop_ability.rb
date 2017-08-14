class MonsterDropAbility < ApplicationRecord
  enum ability_type: %w(Armour Weapon)

  belongs_to :monster
  belongs_to :ability
end
