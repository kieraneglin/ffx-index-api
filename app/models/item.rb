class Item < ApplicationRecord
  has_many :abilities, dependent: :destroy
  has_many :kill_drops, dependent: :destroy
  has_many :steal_drops, dependent: :destroy
  has_many :bribe_drops, dependent: :destroy

  before_save :generate_slug

  def get_mixes
    MixItem.preload(:mix).select('distinct on (mix_id) *').where('item_one_id= ? OR item_two_id= ?', self.id, self.id)
  end
end
