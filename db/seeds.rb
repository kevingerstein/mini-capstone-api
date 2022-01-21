# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Supplier.create!(
#   name: "Amazon",
#   email: "amazon@gmail.com",
#   phone_number: "888-9999"
# )

# Supplier.create!(
#   name: "Ebay",
#   email: "ebay@gmail.com",
#   phone_number: "444-6666"
# )

# products = Product.all
# products.each do |product|
#   image = Image.new(url: product.image_url, product_id: product.id)
#   image.save
# end
Image.create(url: "https://www.kindpng.com/picc/m/106-1066002_displaying-sword-vector-cartoon-sword-transparent-background-hd.png", product_id: 8)

#---NEED TO SEED DUMP TO UPDATE---