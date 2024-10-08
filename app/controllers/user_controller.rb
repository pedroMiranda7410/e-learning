class UserController < ApplicationController
  skip_before_action :authenticate, only: [ :new, :create ]

  def dashboard
    @user_list = User.all
    @series = Serie.all
  end 

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to login_path, notice: 'Conta criada com sucesso.'
    else 
      flash.now[:alert] = 'Erro ao criar conta. Tente novamente'
      render 'new'
    end
  end 

  def profile
  end

  def update
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :type)
    end 
end