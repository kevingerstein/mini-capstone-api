class ProductsController < ApplicationController
  def index
    products = Product.all

    if params[:search]
      products = products.search(params[:search])
    end

    if params[:sort] == "price"
      if params[:sort_order] == "desc"
        products = products.order(price: :desc)
      else
        products = products.order(:price)
      end
    elsif !params[:sort]
      products = products.order(:id)
    end

    if params[:discount]
      products = products.discounted
    end

    render json: products
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      inventory: params[:inventory],
      description: params[:description]
    )
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find(params[:id])
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.inventory = params[:inventory] || product.inventory
    product.description = params[:description] || product.description
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "The product has been destroyed!!!"}
  end

end
