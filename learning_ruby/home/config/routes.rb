Rails.application.routes.draw do
	scope "(:locale)" , locale:  /en|pirate/ do 
  	root to: "welcomes#index"
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
