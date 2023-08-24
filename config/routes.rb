Rails.application.routes.draw do
root to: "home#top"
  devise_for :users
  resources :users, only: [:show, :edit]
  get 'home/about'
  get 'home/top'=>"homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
