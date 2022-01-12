Rails.application.routes.draw do
  get "/all_products", controller: "products", action: "show_all_products"
  get "/book", controller: "products", action: "show_book"
  get "/crayons", controller: "products", action: "show_crayons"
  get "/gel_pencils", controller: "products", action: "show_gel_pencils"

end
