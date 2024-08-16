class ApplicationController < ActionController::Base
  before_action :authenticate

  helper_method :current_user
  helper_method :authenticate

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end 

  def authenticate 
    return redirect_to login_path, alert: 'Acesso não autorizado.' unless current_user.present?
  end 
end
