Rails.application.routes.draw do
  root "cart#index"
  resources :carts ,:controller => "cart" do
    resources :items 
  end  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
