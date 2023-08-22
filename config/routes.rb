Rails.application.routes.draw do
root to: "home#top"
  resources :users, only: [:show, :edit]
  devise_for :users
  get 'home/about'
  get 'home/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
