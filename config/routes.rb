Rails.application.routes.draw do
  devise_for :users
  get 'homes/top'
  get 'homes/new'
  get 'homes/index'
  get 'homes/show'
  get 'homes/edit'
  get 'homes/create'
  get 'homes/edit'
  get 'homes/update'
  get 'homes/destroy'
Rails.application.routes.draw do
# devise_for :users二個書いた
root to: "homes#top"
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
