Rails.application.routes.draw do
  get 'backend' => 'backend#index', as: :backend
  get 'backend/:theme_id' => 'backend#show_theme_content', as: :ba_show_works
  resources :themes do
    resources :works
  end
  get 'om' =>  'pages#om'
  get 'bidrag' => 'pages#bidrag'
  get 'tema/laes' => 'themes#laes', as: :laes
  get 'tema/se' => 'themes#se', as: :se
  get 'tema/hoer' => 'themes#hoer', as: :hoer
  root 'pages#index'
end
