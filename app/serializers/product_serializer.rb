class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :image_url, :is_discounted?, :tax, :total, :friendly_created_at
end
