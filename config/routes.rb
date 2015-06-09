Rails.application.routes.draw do
  root 'sessions#new'

  # sign up
  get '/signup'               => 'users#new'
  post '/users'               => 'users#create'
  get   '/users/:id'          => 'users#show', as: :user
  get '/users/:id/edit'       => 'users#edit', as: 'edit_user'
  patch '/users/:id'          => 'users#update'

  # sign in
  get '/login'        => 'sessions#new'
  post '/sessions'    => 'sessions#create'
  delete '/logout'    => 'sessions#destroy'

  resources :answers,   only: [:new, :create, :destroy]
  resources :courses,   only: [:show]
  resources :enrolls,   only: [:create, :destroy]
  resources :questions, only: [:show, :new, :create, :destroy, :edit, :update]
end

