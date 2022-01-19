class Product < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image_url, presence: true
  validates :description, presence: true, length: { in: 10..500 }
  validates :inventory, presence: true, numericality: true


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
