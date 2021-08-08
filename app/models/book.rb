class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}
  
  # 検索機能
  def self.search(search, word)
    if search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "perfect_match"
      @book = Book.where(title: "#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end
  
  # スコープ　データの呼び出し方法を定義する
  # create_today = 今日投稿したbookを取得。
  scope :created_today, -> { where(created_at: Time.current.all_day) }
  
  # created_yestarday = 昨日投稿されたbookを取得。
  scope :created_yesterday, -> {where(created_at: Time.current.yesterday.all_day)}
    
  # created_this_week = 今週投稿されたbookを取得
  scope :created_this_week, -> {where(created_at: Time.current.all_week)}
  
  # created_last_week = 先週投稿されたbookを取得
  scope :created_last_week, -> {where(created_at: Time.current.last_week.all_week)}
    
end
