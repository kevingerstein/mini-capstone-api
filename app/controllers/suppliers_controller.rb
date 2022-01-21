class SuppliersController < ApplicationController
  def index
    render json: Supplier.all
  end

  def show
    render json: Supplier.find(params[:id])
  end

  def create
    supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    if supplier.save
      render json: supplier
    else
      render json: {errors: supplier.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    supplier = Supplier.find(params[:id])
    supplier.name = params[:name] || supplier.name
    supplier.email = params[:email] || supplier.email
    supplier.phone_number = params[:phone_number] || supplier.phone_number
    if supplier.save
      render json: supplier
    else
      render json: {errors: supplier.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    supplier = Supplier.find(params[:id])
    supplier.destroy
    render json: {message: "The supplier has been destroyed!!!"}
  end
end
