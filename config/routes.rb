Rails.application.routes.draw do
  get 'structures/new'
  root to: 'cards#index'
  resources :cards, only: [:index, :show]

  resources :decks, only: [:index, :show, :new, :create, :destroy ] do
  resources :structures, only: [ :new, :create, :destroy]
  end
end
