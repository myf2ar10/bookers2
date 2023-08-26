Rails.application.routes.draw do
  get 'books/top'
  get 'books/new'
  # 追加
  post 'books' => 'books#create'
  get 'books/index'

  get 'books/edit'
root to: "home#top"
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resources :books, only: [:create]
  end
  resources :books, only: [:show]
  get 'home/about'
  get 'home/top'=>"homes#top"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
