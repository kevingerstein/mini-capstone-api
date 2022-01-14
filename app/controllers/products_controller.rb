class ProductsController < ApplicationController
  def index
    all_products = Product.all
    render json: all_products.as_json
  end

  def show
    item = Product.find_by(id: params[:id])
    render json: {product: item}
  end
end
