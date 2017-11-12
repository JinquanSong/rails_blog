class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout 'admin'

  before_action :authorize

  def current_moderator
    @current_moderator ||= Moderator.find(session[:current_moderator_id]) if session[:current_moderator_id]
  end

  def authorize
    unless current_moderator
      redirect_to '/login', altert: 'Please login to view admin pages'
    end
  end

  def to_boolean(string)
    string.present? && !!string.match(/^(true|t|yes|y|1)$/i)
  end
end