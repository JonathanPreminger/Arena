Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "statistics#index"
  get '/stats_per_show', to: 'statistics#stats_per_show'
  
  resources :reservations do 
    collection do
      post :import
    end
  end
end
