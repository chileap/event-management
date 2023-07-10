Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root to: "home#index", as: :user_root
  end

  # Defines the root path route ("/")
  root "home#index"
end
