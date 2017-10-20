Rails.application.routes.draw do
  root 'static_pages#home'

  get 'users/new'
  get 'static_pages/home'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get  '/search',  to: 'searches#search'
  post  '/search',  to: 'searches#show'


  get '/home', to: 'courses#show'
  post '/enroll', to: 'courses#enroll'
  get "enroll" => "courses#enroll"
  post '/drop', to: 'enrollments#drop'
  match '/users/:id', :to => 'enrollments#show',:as => :user, :via => :get


  resources :subjects
  resources :courses
  resources :instructors
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
