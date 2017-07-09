Rails.application.routes.draw do
  root "tweets#index"

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  match 'tweets' => 'tweets#index', via: [:get, :post]
  get '/:handle', to: 'tweets#show'
end
