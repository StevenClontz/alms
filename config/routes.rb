Rails.application.routes.draw do

  root 'home#index'

  scope :api, defaults: { format: :json } do
    scope :v1 do
      resources :workbooks, only: [:index, :show]
    end
  end

end
