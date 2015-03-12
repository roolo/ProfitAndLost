Rails.application.routes.draw do
  resources :invoices

  devise_for :users
  get 'root/index'

  root to: 'root#index'
end
