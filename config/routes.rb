Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  resource :posts
  root to: 'visitors#new'
end
