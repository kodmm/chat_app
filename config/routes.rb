Rails.application.routes.draw do

  
  devise_for :users
  root to: 'rooms#show'
  post '/rooms/show', to: 'rooms#create', as: "messages"
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
