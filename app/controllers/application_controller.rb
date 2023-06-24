class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: params[:user_id]) || User.first
  end

  helper_method :current_user
end
