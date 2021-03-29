Rails.application.routes.draw do
  
  resources :homework_reviews
  get 'usuarios/payment', as: :payments
  get 'email_links/new'
  get 'email_links/validate', as: :email_link
  get 'chats/reported', as: :reported_chats
  post 'email_links/create', as: :magic_link

  resources :chats do
    resources :messages  
    resources :orders do 
      resources :extension_orders
    end
    resources :homeworks
    resources :extensions
  end
  resources :job_applications
  get 'job_applications/new_editor_job', as: :new_editor_job
  resources :progresses
  devise_for :users
  resources :usuarios, as: :users
  resources :careers
  resources :mounts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
end
