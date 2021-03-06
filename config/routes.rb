require 'sidekiq/web'

Rails.application.routes.draw do
  get 'agreement_previews/show'
  get '/zoo', to: 'agreement_approval_steps#project_scope_approval'

  resources :agreement_previews, only: [:show]
  # resources :agreement_authorization_requests, only: [:new, :create]

  resources :crm_docs
  resources :approvals
  resources :sections
  resources :deliverables
  resources :agreement_approval_steps


  resources :projects do
    resources :project_users, path: :users, module: :projects
    resources :agreements
  end

  resources :payment_schedules do
        resources :approvals, shallow: true
  end
  resources :agreements do
    resources :deliverables, shallow: true
    resources :scheduled_payments, shallow: true
    resources :approvals, shallow: true

    resources :agreement_approval_steps
    resources :approval_requests, path: :approval_requests, module: :agreements


  end

  resources :people

  resources :documents do
      resources :contact_details, shallow: true
      resources :scope_documents
      ## TODO these routes may be deprecated with payment stuff to be connected to agreeements
      # resources :payments
      # resources :payment_schedules
  end

  resources :conversations do
    resources :messages
  end

  namespace :admin do
      resources :users

      root to: "users#index"
    end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
