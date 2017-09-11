Rails.application.routes.draw do

  get 'events/index'

  get 'events/new'

  get 'events/:id' => 'events#show' ,as: 'show_event'

  

  post 'events' => 'events#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/users/new' => 'users#new'
  get '/users/:id' => 'users#show' , as: 'show'
  post '/users' => 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
