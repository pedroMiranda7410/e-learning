class UserController < ApplicationController

  def dashboard
    @user = User.find_by_id(session[:user_id])
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

  def edit
    user = User.find_by_id(params[:id])
    return render json: user, status: :ok 
  end

  def update
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :type)
    end
end