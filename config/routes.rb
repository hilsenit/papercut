Rails.application.routes.draw do
  root 'pages#index'
  get 'om' =>  'pages#om'
  get 'bidrag' => 'pages#bidrag'
  resources :themes
  get 'tema/laes' => 'themes#laes', as: :laes
  get 'tema/se' => 'themes#se', as: :se
  get 'tema/hoer' => 'themes#hoer', as: :hoer
end
