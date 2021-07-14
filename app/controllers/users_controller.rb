class UsersController < ApplicationController
  
  def index
    @new_book = Book.new
    @users = User.all
  end
  
  def show
    @new_book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end
  
end
