Rails.application.routes.draw do
  get 'graphs/index'
  get 'graphs/draw', to: 'graphs#draw'

  resources :progresses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
