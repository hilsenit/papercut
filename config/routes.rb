Rails.application.routes.draw do
  resources :news
  get 'backend' => 'backend#index', as: :backend
  get 'backend/:theme_id' => 'backend#show_theme_content', as: :ba_show_works
  resources :themes do
    resources :works, except: :show
  end
  get 'om' =>  'pages#om'
  get 'bidrag' => 'pages#bidrag'
  get 'tema/:work_category' => 'works#show_category', as: :works_category

  post '/tinymce_assets' => 'tinymce_assets#create'

  root 'pages#frontpage'
end
