class UsersController < ApplicationController


  def new
    @user = User.new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    　flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      flash[:notice] = "error"
      redirect_to book_path
    end
  end


  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
     redirect_to user_path(current_user.id)
    end
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "successfully"
     redirect_to user_path(@user.id)
    else
     flash[:notice] = "error"
     render :edit
    end
  end


  private

  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
