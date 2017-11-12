class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_page

  def current_page
    nil
  end
end
