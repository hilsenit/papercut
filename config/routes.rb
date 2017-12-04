Rails.application.routes.draw do
  resources :news
  get 'backend' => 'backend#index', as: :backend
  get 'backend/:theme_id' => 'backend#show_theme_content', as: :ba_show_works
  resources :themes do
    resources :works
  end
  get 'om' =>  'pages#om'
  get 'bidrag' => 'pages#bidrag'
  get 'tema/laes' => 'works#laes', as: :laes
  get 'tema/se' => 'works#se', as: :se
  get 'tema/hoer' => 'works#hoer', as: :hoer
  root 'pages#index'
end
