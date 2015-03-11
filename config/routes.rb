Rails.application.routes.draw do
  devise_for :users
  get 'root/index'

  root to: 'root#index'
end
