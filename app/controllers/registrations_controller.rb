class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end 
  
  def create
    @user = signup(params[:name], [:email], [:password])
    if @user
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error"
      render :new
    end 
  end

end
