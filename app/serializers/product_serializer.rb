class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :is_discounted?, :tax, :total, :friendly_created_at

  belongs_to :supplier
  has_many :images
end
