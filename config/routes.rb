Rails.application.routes.draw do
  devise_for :users
  #post 'tasks/change_priority', to: 'tasks#change_priority', as: 'task'
  root 'lists#index'
  resources :lists
  resources :tasks do   
    collection {post :change_priority}
    member do
      patch :complete
    end
  end
end
