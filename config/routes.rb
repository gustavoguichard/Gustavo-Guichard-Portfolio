Gustavoguichard::Application.routes.draw do

  resources :site_settings, only: [:edit, :new, :update, :create]
  
  resources :services, :testimonials, :projects do
    post :sort, on: :collection
  end
  
  match '/send_mail/' => 'static_pages#send_mail', :as => :send_mail
  match '/home/' => 'static_pages#home', :as => :home
  match '/portfolio/' => 'projects#index', :as => :portfolio
  match '/login/' => 'sessions#new', :as => :login
  match '/auth/:provider/callback' => 'sessions#create'
  match '/logout/' => 'sessions#destroy', :as => :logout

  match '/admin/'  => 'site_settings#edit', :as => :admin
 
  match '/contact/' => 'static_pages#contact', :as => :contact, :via => :get
  match '/contact/' => 'static_pages#send_mail', :as => :messages, :via => :post
  
  # Retrieve images from database
  mount PostgresqlLoStreamer::Engine => "/project_thumb"
  mount PostgresqlLoStreamer::Engine => "/project_image"
  mount PostgresqlLoStreamer::Engine => "/service_image"
  mount PostgresqlLoStreamer::Engine => "/testimonial_avatar"

  root :to => 'static_pages#home'

end