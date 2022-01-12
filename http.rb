require "http"
require "tty-table"
response = HTTP.get("http://localhost:3000/all_products")
products_data = response.parse(:json)
pp products_data

table = TTY::Table.new(["name","price", "description"], [])
products_data.each do |product|
  table << [product["name"], product["price"], product["description"]]
end

puts table.render(:ascii)
