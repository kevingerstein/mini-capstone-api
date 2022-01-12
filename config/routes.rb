Rails.application.routes.draw do
  get "/all_products" => "products#show_all_products"
  get "/item" => "products#show_item"
  get "/item/:id" => "products#show_item"

end
