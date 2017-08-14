require "administrate/base_dashboard"

class ApiRequestDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    api_user: Field::BelongsTo,
    id: Field::Number,
    ip: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    url_path: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :api_user,
    :id,
    :ip,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :api_user,
    :id,
    :ip,
    :created_at,
    :updated_at,
    :url_path,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :api_user,
    :ip,
    :url_path,
  ].freeze

  # Overwrite this method to customize how api requests are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(api_request)
  #   "ApiRequest ##{api_request.id}"
  # end
end
