class Mix < ApplicationRecord
  has_many :mix_items, dependent: :destroy

  before_save :generate_slug
end
