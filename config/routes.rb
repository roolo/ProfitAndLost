Rails.application.routes.draw do
  get 'invoices/index'
  get 'invoices/edit'

  devise_for :users
  get 'root/index'

  root to: 'root#index'
end
