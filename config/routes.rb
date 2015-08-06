Rails.application.routes.draw do
  scope defaults: { format: :json } do
    devise_for :users, only: []

    namespace :v1 do
      devise_scope :user do
        resources :sessions, only: :create
      end
    end
  end
end
