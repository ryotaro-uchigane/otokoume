Rails.application.routes.draw do

  resources :users

  get 'graphs', to: "graphs#index"

  resources :progresses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
