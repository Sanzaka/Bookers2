class BookCommentsController < ApplicationController
  
  def create
    @book = Book.find(params[:book_id])
    comment = BookComment.new(comment_params)
    comment.user_id = current_user.id
    comment.book_id = @book.id
    comment.save
    # redirect_to request.referer
  end
  
  def destroy
    book = Book.find(params[:book_id])
    book_comment = BookComment.find_by(book_id: book.id, id: params[:id])
    book_comment.destroy
    redirect_to request.referer
  end
  
  private
  
  def comment_params
    params.require(:book_comment).permit(:comment)
  end
end
