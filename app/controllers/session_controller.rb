class SessionController < ApplicationController
  def new 
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user.present? && @user.password == params[:password]
      puts "Usuário logado com sucesso!"
    else
      puts "Usuário inválido"
    end 
  end
end