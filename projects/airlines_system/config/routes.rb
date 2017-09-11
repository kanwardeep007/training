Rails.application.routes.draw do
  get 'about/about_method'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index' 
end
