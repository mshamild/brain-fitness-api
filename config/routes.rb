Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    devise_for :users

    namespace :v1 do
      devise_scope :user do
        resources :sessions, only: :create
        resource :registrations, only: [:create, :update]
      end

      resources :games, only: :create
    end
end
