class OrdersController < ApplicationController
  before_action :authenticate_user 

  def index
    render json: current_user.orders
  end

  def show
    order = current_user.orders.find(params[:id])
    render json: order
  end
  
  def create
    product = Product.find(params[:product_id])
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: product.price * params[:quantity],
      tax: product.tax * params[:quantity],
      total: product.total * params[:quantity]
    )
    order.save
    render json: order
  end
end
