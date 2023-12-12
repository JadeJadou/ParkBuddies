class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def buddy
    @buddy = User.find(params[:id])
  end

end
