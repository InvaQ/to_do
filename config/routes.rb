Rails.application.routes.draw do
  devise_for :users
  root 'lists#index'
  resources :lists
  resources :tasks do   
    collection {post :change_priority}
    member do
      patch :complete
    end
  end
end
