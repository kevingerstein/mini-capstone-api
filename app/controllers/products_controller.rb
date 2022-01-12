class ProductsController < ApplicationController
  def show_all_products
    all_products = Product.all
    render json: all_products.as_json
  end

  def show_book
    book = Product.find_by(name: "book")
    render json: book.as_json
  end

  def show_crayons
    crayons = Product.find_by(name: "crayons")
    render json: crayons.as_json
  end

  def show_gel_pencils
    gel_pencils = Product.find_by(name: "gel pencils")
    render json: gel_pencils.as_json
  end
end
