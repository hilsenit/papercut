Rails.application.routes.draw do
  root 'pages#index'
  get 'om' =>  'pages#om'
  get 'bidrag' => 'pages#bidrag'
  resources :themes
end
