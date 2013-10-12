Gustavoguichard::Application.routes.draw do  
  resources :testimonials, :projects do
    post :sort, on: :collection
  end
  
  match '/send_mail/' => 'static_pages#send_mail', :as => :send_mail
  match '/login/' => 'sessions#new', :as => :login
  match '/auth/:provider/callback' => 'sessions#create'
  match '/logout/' => 'sessions#destroy', :as => :logout
 
  match '/contact/' => 'static_pages#send_mail', :as => :messages, :via => :post
  
  # Retrieve images from database
  mount PostgresqlLoStreamer::Engine => "/project_image"
  mount PostgresqlLoStreamer::Engine => "/project_thumb"
  mount PostgresqlLoStreamer::Engine => "/testimonial_avatar"

  root :to => 'static_pages#home'

end