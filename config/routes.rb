Rails.application.routes.draw do
  post 'tasks/change_priority', to: 'tasks#change_priority', as: 'task'
  root 'lists#index'
  resources :lists
  resources :tasks do
    collection {post :change_priority}
    member do
      patch :complete
    end
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
