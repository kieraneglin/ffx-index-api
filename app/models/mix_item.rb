class MixItem < ApplicationRecord
  belongs_to :mix, dependent: :destroy

  belongs_to :item_one, class_name: "Item", foreign_key: :item_one_id, dependent: :destroy
  belongs_to :item_two, class_name: "Item", foreign_key: :item_two_id, dependent: :destroy
end
