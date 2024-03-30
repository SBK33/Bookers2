Rails.application.routes.draw do
  resources :books, only: [:new, :index, :show , :create ,:destroy]
  #URL名は確認すること
  
  devise_for :users
  root to: "homes#top"
  get "home/about" => 'homes#about', as: :home_about
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
