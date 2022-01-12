Rails.application.routes.draw do
  get "/all_products", controller: "products", action: "show_all_products"
end
