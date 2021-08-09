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
    
    # 投稿データ表示
    @today = @user.books.created_today
    @yesterday = @user.books.created_yesterday
    @this_week = @user.books.created_this_week
    @last_week = @user.books.created_last_week
    #　どちらかのデータが空だと、投稿割合比較の計算ができないため、それの判定を行う
    # 今日と昨日の投稿数比較
    if @today.count == 0 || @yesterday.count == 0
      @compare_day = "本日の投稿、もしくは前日の投稿がありません"
    else
      @compare_day = "#{(@today.count / @yesterday.count) * 100}" + "%"
    end
    # 今週と先週の投稿数比較
    if @this_week.count == 0 || @last_week.count == 0
      @compare_week = "今週の投稿、もしくは先週の投稿がありません"
    else
      @compare_week = "#{(@this_week.count / @last_week.count) * 100}" + "%"
    end
    
    # 過去７日分の投稿数
    @two_days_ago = @user.books.created_two_days_ago
    @three_days_ago = @user.books.created_three_days_ago
    @four_days_ago = @user.books.created_four_days_ago
    @five_days_ago = @user.books.created_five_days_ago
    @six_days_ago = @user.books.created_six_days_ago
    @seven_days_ago = @user.books.created_seven_days_ago
    
    # gon用（javascriptへ受け渡すデータを記述）
    gon.today = @today.count
    gon.yesterday = @yesterday.count
    gon.two_days_ago = @two_days_ago.count
    gon.three_days_ago = @three_days_ago.count
    gon.four_days_ago = @four_days_ago.count
    gon.five_days_ago = @five_days_ago.count
    gon.six_days_ago = @six_days_ago.count
  end
  
  def edit
    @user = User.find(current_user.id)
    @user_test = User.find(params[:id])
    if @user != @user_test
      redirect_to user_path(@user.id)
    end
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
