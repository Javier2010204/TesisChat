Rails.application.routes.draw do
  
  get 'email_links/new'
  get 'email_links/create'
  resources :chats do
    resources :messages  
    resources :orders
    resources :homeworks
    resources :extensions
  end
  resources :job_applications
  resources :progresses
  devise_for :users
  resources :usuarios, as: :users
  resources :careers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
end
