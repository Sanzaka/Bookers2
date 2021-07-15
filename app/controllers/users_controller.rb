class UsersController < ApplicationController
  
  def index
    @new_book = Book.new
    @users = User.all
    @side_user = User.find(current_user.id)
  end
  
  def show
    @new_book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @side_user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
