Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticated :user do
    get "/dashboard", to: "dashboard#index", as: :authenticated_root
  end

  # Defines the root path route ("/")
  root "home#index"
end
