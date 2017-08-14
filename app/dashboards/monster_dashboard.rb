require "administrate/base_dashboard"

class MonsterDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    locations: Field::HasMany,
    kill_drops: Field::HasMany,
    kill_dropped_items: Field::HasMany.with_options(class_name: "Item"),
    steal_drops: Field::HasMany,
    steal_dropped_items: Field::HasMany.with_options(class_name: "Item"),
    monster_drop_abilities: Field::HasMany,
    drop_abilities: Field::HasMany.with_options(class_name: "Ability"),
    bribe_drop: Field::HasOne,
    bribe_dropped_item: Field::HasMany.with_options(class_name: "Item"),
    element: Field::HasOne,
    id: Field::Number,
    name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    slug: Field::String,
    health: Field::Number,
    overkill: Field::Number,
    strength: Field::Number,
    defense: Field::Number,
    magic: Field::Number,
    magic_defense: Field::Number,
    mp: Field::Number,
    agility: Field::Number,
    luck: Field::Number,
    ap: Field::Number,
    evasion: Field::Number,
    accuracy: Field::Number,
    gil: Field::Number,
    boss: Field::Boolean,
    notes: Field::String,
    skills: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :locations
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :locations,
    :kill_drops,
    :steal_drops,
    :drop_abilities,
    :bribe_drop,
    :element,
    :name,
    :slug,
    :health,
    :overkill,
    :strength,
    :defense,
    :magic,
    :magic_defense,
    :mp,
    :agility,
    :luck,
    :ap,
    :evasion,
    :accuracy,
    :gil,
    :boss,
    :notes,
    :skills,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :locations,
    :kill_drops,
    :kill_dropped_items,
    :steal_drops,
    :steal_dropped_items,
    :monster_drop_abilities,
    :drop_abilities,
    :bribe_drop,
    :bribe_dropped_item,
    :element,
    :name,
    :slug,
    :health,
    :overkill,
    :strength,
    :defense,
    :magic,
    :magic_defense,
    :mp,
    :agility,
    :luck,
    :ap,
    :evasion,
    :accuracy,
    :gil,
    :boss,
    :notes,
    :skills,
  ].freeze

  # Overwrite this method to customize how monsters are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(monster)
    monster.name
  end
end
