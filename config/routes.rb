Rails.application.routes.draw do
  get 'todo_items/index'

  resources :todo_lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'todo_lists#index'
end
