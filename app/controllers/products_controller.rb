class ProductsController < ApplicationController
  def show_all_products
    all_products = Product.all
    render json: all_products.as_json
  end
end
