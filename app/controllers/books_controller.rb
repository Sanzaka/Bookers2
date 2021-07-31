class BooksController < ApplicationController
  
  def index
    @new_book = Book.new
    @books = Book.all
    @book = Book.new
    @side_user = User.find(current_user.id)
  end
  
  def create
    @books = Book.all
    @new_book = Book.new
    @side_user = User.find(current_user.id)
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    @test_book = Book.find(current_user.id)
    if @book.user.id == @test_book.user.id
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def show
    @new_book = Book.new
    @comment = BookComment.new
    @book = Book.find(params[:id])
    @books = Book.all
    @side_user = User.find(@book.user.id)
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end