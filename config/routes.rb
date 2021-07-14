Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "homes#top", as:"home_top"
  get "home/about" => "homes#about", as:"home_about"
  resources :books, only:[:index, :update, :create, :destroy, :show, :edit]
  resources :users, only:[:edit, :update, :index, :show]
end
