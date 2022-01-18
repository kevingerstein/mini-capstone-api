class Product < ApplicationRecord

  def is_discounted?
    price < 10
  end

  def tax
    (price * 0.09).round(2)
  end

  def total
    (price + tax).round(2)
  end

  def friendly_created_at
    created_at.strftime("%b %d, %Y")
  end

end
