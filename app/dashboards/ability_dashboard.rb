require "administrate/base_dashboard"

class AbilityDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    item: Field::BelongsTo,
    monster_drop_abilities: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    ability_type: Field::String,
    item_amount: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    effect: Field::String,
    slug: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :item
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :item,
    :name,
    :monster_drop_abilities,
    :ability_type,
    :item_amount,
    :effect,
    :slug,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :item,
    :monster_drop_abilities,
    :name,
    :ability_type,
    :item_amount,
    :effect,
    :slug,
  ].freeze

  # Overwrite this method to customize how abilities are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(ability)
    ability.name
  end
end
