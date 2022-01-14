require "http"
require "tty-table"
response = HTTP.get("http://localhost:3000/products")
products = response.parse(:json)
pp products

table = TTY::Table.new(["id", "name","price", "description"], [])
products.each do |product|
  table << [product["id"], product["name"], product["price"], product["description"]]
end

puts "All products: "
puts table.render(:ascii)
puts

puts "Select an id for a specific product: "
id = gets.chomp.to_i
response = HTTP.get("http://localhost:3000/products/#{id}")
product = response.parse(:json)["product"]
pp product
p product["id"]
p product["name"]
p product["price"]
p product["description"]
table2 = TTY::Table.new(["id", "name","price", "description"], [])
table2 << [product["id"], product["name"], product["price"], product["description"]]
puts table2.render(:ascii)