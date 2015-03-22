Rails.application.routes.draw do

  root 'home#index'

  resources :workbooks, only: [:index]

end
