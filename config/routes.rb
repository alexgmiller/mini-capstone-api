Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/all_products", controller: "products", action: "all_products"
  # get "/all_products" => "products#all_products"
  # get "/first_product" => "products#first_product"
  # get "/second_product" => "products#second_product"
  # get "/third_product" => "products#third_product"
  # get "/product_search" => "products#product_search"
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  post "/orders" => "orders#create" 
end
