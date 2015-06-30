Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :posts do
    member do
      put 'upvote', to: 'posts#upvote'
      put 'downvote', to: 'posts#downvote'
    end
    resources :comments
  end
  root to: 'visitors#new'
end
