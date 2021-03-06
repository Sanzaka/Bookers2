Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:"homes#top"
  get "home/about" => "homes#about", as:"home_about"
  resources :users, only:[:edit, :update, :index, :show] do
    resource :relationships, only:[:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end
  resources :books, only:[:index, :update, :create, :destroy, :show, :edit] do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
  get "search_books" => "search_books#index", as:"search_books"
  get "search" => "searches#search", as:"search"
end
