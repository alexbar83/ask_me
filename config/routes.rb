Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  root to: 'questions#index'
  resources :questions
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update destroy]
end
