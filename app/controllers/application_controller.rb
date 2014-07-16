class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html, :json

  def current_user
    super || current_admin_user
  end

  def not_found
    raise ActionController::RoutingError.new('Error 404: Page not found')
  end

end
