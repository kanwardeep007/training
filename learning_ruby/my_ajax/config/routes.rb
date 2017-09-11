Rails.application.routes.draw do
  get 'tasks/new' => "tasks#new"
  post 'tasks' => "tasks#create"
  post 'tasks/complete' => "tasks#complete", as: :tasks_complete 
  post 'tasks/incomplete' => "tasks#incomplete", as: :tasks_incomplete
  root "tasks#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
