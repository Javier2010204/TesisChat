Rails.application.routes.draw do
  
  resources :chats do
    resources :messages  
    resources :orders
  end
  resources :job_applications
  resources :progresses
  devise_for :users
  resources :usuarios, as: :users
  resources :careers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
end
