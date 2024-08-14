class UserController < ApplicationController

  def dashboard
    @user = User.find_by_id(session[:user_id])
  end

  def create
  end 

  def instructor?
    self.instructor
  end
end