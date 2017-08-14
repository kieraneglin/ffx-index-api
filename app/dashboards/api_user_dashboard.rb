require "administrate/base_dashboard"

class ApiUserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    api_requests: Field::HasMany,
    id: Field::Number,
    api_key: Field::String,
    website: Field::String,
    email: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    banned: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :api_requests,
    :id,
    :api_key,
    :website,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :api_requests,
    :id,
    :api_key,
    :website,
    :email,
    :created_at,
    :updated_at,
    :banned,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :api_requests,
    :api_key,
    :website,
    :email,
    :banned,
  ].freeze

  # Overwrite this method to customize how api users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(api_user)
  #   "ApiUser ##{api_user.id}"
  # end
end
