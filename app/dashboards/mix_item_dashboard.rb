require "administrate/base_dashboard"

class MixItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    mix: Field::BelongsTo,
    item_one: Field::BelongsTo.with_options(class_name: "Item"),
    item_two: Field::BelongsTo.with_options(class_name: "Item"),
    id: Field::Number,
    item_one_id: Field::Number,
    item_two_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :mix,
    :item_one,
    :item_two,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :mix,
    :item_one,
    :item_two,
    :id,
    :item_one_id,
    :item_two_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :mix,
    :item_one,
    :item_two,
    :item_one_id,
    :item_two_id,
  ].freeze

  # Overwrite this method to customize how mix items are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(mix_item)
    "#{mix_item.item_one.name} - #{mix_item.item_two.name}"
  end
end
