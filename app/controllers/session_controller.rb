class SessionController < ApplicationController
  def new 
  end

  def create
    user = User.find_by_email(params[:email])

    if user.present? && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to root_path
    else 
      flash.now[:alert] = 'Email/Senha Inválido'
      render 'new'
    end
  end
end