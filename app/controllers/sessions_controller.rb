class SessionsController < ApplicationController
  def new
    @user = User.new
  end 
  
  def create
    @user = login(params[:name], params[:password])
    if @user
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
      render :new
    end 
  end
end
