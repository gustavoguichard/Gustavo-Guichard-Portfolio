Gustavoguichard::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.

  match '/send_mail/' => 'static_pages#send_mail', :as => :send_mail
  match '/home/' => 'static_pages#home', :as => :home
  match '/portfolio/' => 'projects#index', :as => :portfolio
  match '/contact/' => 'static_pages#contact', :as => :contact, :via => :get
  match '/contact/' => 'static_pages#send_mail', :as => :messages, :via => :post
  match '/projects/sort/' => 'projects#sort', :as => :sort_projects, :via => :post
  match '/testimonials/sort/' => 'testimonials#sort', :as => :sort_testimonials, :via => :post
  match '/services/sort/' => 'services#sort', :as => :sort_services, :via => :post
  match '/login/' => 'sessions#new', :as => :login
  match '/auth/:provider/callback' => 'sessions#create'
  match '/logout/' => 'sessions#destroy', :as => :logout

  match '/admin/'  => 'site_settings#edit', :as => :admin
 
  
  resources :site_settings
  resources :services
  resources :testimonials
  resources :projects

  root :to => 'static_pages#home'

end
