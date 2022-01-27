class Product < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { in: 10..500 }
  validates :inventory, presence: true, numericality: true

  scope :search, ->(name) { where("name iLIKE ?", name) }
  scope :discounted, -> { where('price < ?', 10) }

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :product_categories
  has_many :categories, through: :product_categories

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
