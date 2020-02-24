Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/feed', to: 'feed#index', as: 'product_feed'
    end
  end
end
