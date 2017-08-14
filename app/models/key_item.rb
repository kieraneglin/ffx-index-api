class KeyItem < ApplicationRecord
  belongs_to :location, optional: true

  before_save :generate_slug

end
