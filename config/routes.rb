Rails.application.routes.draw do
  root 'courses#index'

  # sign up
  get '/signup'       => 'users#new'
  post '/users'       => 'users#create'
  get '/users/:id' => 'users#show', as: :user

  # sign in
  get '/login'        => 'sessions#new'
  post '/sessions'    => 'sessions#create'
  get '/logout'     => 'sessions#destroy'

  get '/courses'      => 'courses#index'
  get '/courses/:id'  => 'courses#show', as: 'course'


  get '/questions/new'      => 'questions#new', as: 'new_question'
  get '/questions/:id'      => 'questions#show', as: 'question' 
  get '/questions/:id/edit' => 'questions#edit', as: 'edit_question' 
  patch '/questions/:id'    => 'questions#update'
  post '/questions'         => 'questions#create'
  delete '/questions/:id'   => 'questions#destroy'
end

