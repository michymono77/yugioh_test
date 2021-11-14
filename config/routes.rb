Rails.application.routes.draw do
  root to: 'pages#home'
  resources :cards, only: [:index, :show]
end
