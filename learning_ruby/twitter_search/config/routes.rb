Rails.application.routes.draw do

  # match "/" , :to => 'mains#create',:via => 'post'
  post '/' => 'mains#create', as: 'form_create'
  get '/' => 'mains#index' , as: 'form_index'
  # match ':controller(/:action(/:id))' , :via => [:get, :post]
  root 'mains#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
