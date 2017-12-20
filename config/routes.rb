Rails.application.routes.draw do

  devise_for :users

  get 'backend' => 'backend#index', as: :backend
  get 'backend/:theme_id' => 'backend#show_theme_content', as: :ba_show_works

  resources :news
  resources :themes do
    resources :works, except: [:show, :index]
  end
  get '/themes/:theme_id/works/:work_id' => 'works#index', as: :show_theme_works # new index
  get '/themes/:theme_id/works/:work_id' => 'works#show_this_category', as: :show_this_category
  get 'tema/:work_category' => 'works#show_category', as: :works_category

  resources :pages

  get 'om' =>  'pages#om'
  get 'bidrag' => 'pages#bidrag'
  get 'cookies' => 'pages#cookies'

  # For TextImage in TinyMCE to Carrierwave
  post '/tinymce_assets' => 'tinymce_assets#create'

  root to: 'pages#frontpage'
end
