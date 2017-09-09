Rails.application.routes.draw do

  get 'users/index'

  get 'users/:id', to: 'users#show'
  get 'users/:id/edit', to: 'users#edit'
  patch 'users/:id', to: 'users#update'

  get 'graphs/index'
  get 'graphs/draw', to: 'graphs#draw'

  resources :progresses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
