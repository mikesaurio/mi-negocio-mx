class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  # after_filter :verify_authorized, except: [:index, :show, :new, :edit]

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  #helper_method :current_user

  #def current_user
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end

  def verify_admin
    admin_is_logged_in? || not_found
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def admin_is_logged_in?
    authenticate_user! && current_user.admin?
  end
end
