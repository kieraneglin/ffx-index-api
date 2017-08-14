require "administrate/base_dashboard"

class KillDropDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    monster: Field::BelongsTo,
    item: Field::BelongsTo,
    id: Field::Number,
    amount: Field::Number,
    rare: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :monster,
    :item,
    :amount,
    :rare
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :monster,
    :item,
    :amount,
    :rare,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :monster,
    :item,
    :amount,
    :rare,
  ].freeze

  # Overwrite this method to customize how kill drops are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(kill_drop)
  #   "#{kill_drop.item.name} - #{kill_drop.amount}"
  # end
end
