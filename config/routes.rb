Rails.application.routes.draw do
  get 'books/top'
  get 'books/new'
  # 追加
  post 'books' => 'books#create'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
root to: "home#top"
  devise_for :users
  resources :users, only: [:show, :edit]
  get 'home/about'
  get 'home/top'=>"homes#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
