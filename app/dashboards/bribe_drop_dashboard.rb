require "administrate/base_dashboard"

class BribeDropDashboard < Administrate::BaseDashboard
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
    cost: Field::Number,
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
    :cost
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :monster,
    :item,
    :id,
    :amount,
    :cost,
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
    :cost,
  ].freeze

  # Overwrite this method to customize how bribe drops are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(bribe_drop)
    "#{bribe_drop.amount} x #{bribe_drop.item.name} for #{bribe_drop.cost}"
  end
end
