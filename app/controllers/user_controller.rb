class UserController < ApplicationController

  def dashboard
    @user = User.find_by_id(1)
  end

  def create
  end 
end