Rails.application.routes.draw do
  root "tweets#index"

  match "tweets" => "tweets#index", via: [:get, :post]
end
