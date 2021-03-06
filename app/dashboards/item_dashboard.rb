require "administrate/base_dashboard"

class ItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    abilities: Field::HasMany,
    kill_drops: Field::HasMany,
    steal_drops: Field::HasMany,
    bribe_drops: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    effect: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    effect_type: Field::String,
    slug: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :effect,
    :effect_type,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :abilities,
    :kill_drops,
    :steal_drops,
    :bribe_drops,
    :id,
    :name,
    :effect,
    :created_at,
    :updated_at,
    :effect_type,
    :slug,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :abilities,
    :kill_drops,
    :steal_drops,
    :bribe_drops,
    :name,
    :effect,
    :effect_type,
    :slug,
  ].freeze

  # Overwrite this method to customize how items are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(item)
    item.name
  end
end
