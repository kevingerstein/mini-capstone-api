class Category < ApplicationRecord
  has_many :product_categories

  def products
    product_array = []
    product_categories.each do |product_category|
      product_array << product_category.product
    end
    product_array
  end

end
