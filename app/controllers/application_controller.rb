class ApplicationController < ActionController::Base
  before_action :authenticate
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    else
      @current_user = nil
    end
  end 

  def authenticate
    redirect_to login_path, alert:'Acesso não autorizado. Efetue o login' unless current_user.present?
  end
end
