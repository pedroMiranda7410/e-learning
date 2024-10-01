class SessionController < ApplicationController
  skip_before_action :authenticate, only: [ :new, :create ]

  def new 
    session[:user_id] = nil
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

  def destroy
    session[:user_id] = nil

    redirect_to login_path, notice: "Deslogado com sucesso!"
  end
end