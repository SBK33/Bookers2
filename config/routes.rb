Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :books, only: [:index, :show , :create, :edit, :update, :destroy]
  #URL名は確認すること
  #usersに対するルーティングの重複


  root to: "homes#top"
  get "home/about" => 'homes#about', as: :home_about
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
