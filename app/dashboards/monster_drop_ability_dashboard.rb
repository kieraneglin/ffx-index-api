require "administrate/base_dashboard"

class MonsterDropAbilityDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    monster: Field::BelongsTo,
    ability: Field::BelongsTo,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    ability_type: Field::String.with_options(searchable: true),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :monster,
    :ability,
    :id,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :monster,
    :ability,
    :id,
    :created_at,
    :updated_at,
    :ability_type,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :monster,
    :ability,
    :ability_type,
  ].freeze

  # Overwrite this method to customize how monster drop abilities are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(monster_drop_ability)
    "#{monster_drop_ability.ability.name}"
  end
end
