class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :cache_page, :set_format, :validate_api_key

  private

  def cache_page
    expires_in 1.second, public: true
  end

  # Treat every incoming response as json
  def set_format
    request.format = 'json' unless params[:controller].include? 'admin'
  end

  def validate_api_key
    unless params[:controller].include? 'admin'
      # NOTE: This only gets hit if asset is not served by rack::cache.
      # This is fine for my application, however you may want to fix this.
      api_user = ApiUser.find_by(api_key: get_api_key)

      if api_user.present? && api_user.permitted
        api_user.api_requests.create(ip: request.remote_ip, url_path: request.original_url)
      else
        @code = 401
        @data = 'unauthorized - please check your API key'
        render 'errors/show'
      end
    end
  end

  def get_api_key
    if params[:api_key].present?
      params[:api_key]
    else
      authenticate_with_http_token do |token, options|
        token
      end
    end
  end
end
