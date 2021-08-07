class FavoritesController < ApplicationController
  
  def create
    @book = Book.find(params[:book_id])
    favorite = Favorite.new(book_id: params[:book_id])
    favorite.user_id = current_user.id
    favorite.save
    # 非同期化のため、redirect_toを削除
    # redirect_to request.referer
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    favorite = Favorite.find_by(book_id: params[:book_id])
    favorite.destroy
    # 非同期化のため、redirect_toを削除
    # redirect_to request.referer
  end
end
