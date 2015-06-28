Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :posts do
    resources :comments
  end
  root to: 'visitors#new'
end
