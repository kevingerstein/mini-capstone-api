require "http"
require "tty-table"
system("clear")

def index()
  #get request to show all products
  response = HTTP.get("http://localhost:3000/products")
  products = response.parse(:json)

  #Creates a table in terminal with TTY gem showing product information
  table = TTY::Table.new(["id", "name","price", "description"], [])
  products.each do |product|
    table << [product["id"], product["name"], product["price"], product["description"]]
  end
  puts "All products: "
  puts table.render(:ascii)
  puts
end

def show()
  #Grab product id in terminal from user and send a get request to show product
  puts "Select an id for a specific product: "
  id = gets.chomp.to_i
  response = HTTP.get("http://localhost:3000/products/#{id}")
  product = response.parse(:json)

  #Creates a table in terminal with TTY gem showing product information
  table2 = TTY::Table.new(["id", "name","price", "description"], [])
  table2 << [product["id"], product["name"], product["price"], product["description"]]
  puts table2.render(:ascii)
  puts
end

def create()
  #Grab product information in terminal from user
  puts "Creating new product."
  puts "Enter a product name:"
  name = gets.chomp
  puts "Enter a product price:"
  price = gets.chomp.to_i
  puts "Enter a product description:"
  description = gets.chomp
  puts "Enter an image url:"
  image_url = gets.chomp

  #post request with data grabbed from user to create a new product
  response = HTTP.post("http://localhost:3000/products", :form => {
    name: name,
    price: price,
    description: description,
    image_url: image_url
    })
  product = response.parse(:json)

  #Creates a table in terminal with TTY gem showing product information
  table_create = TTY::Table.new(["id", "name","price", "description"], [])
  table_create << [product["id"], product["name"], product["price"], product["description"]]
  puts table_create.render(:ascii)
end

def update()
  #patch request with paramaters to update
  response = HTTP.patch("http://localhost:3000/products/1", :form => {image_url: "https://www.adazing.com/wp-content/uploads/2019/02/open-book-clipart-03.png" })
  product = response.parse(:json)

  #Creates a table in terminal with TTY gem showing product information
  table_create = TTY::Table.new(["id", "name","price", "description"], [])
  table_create << [product["id"], product["name"], product["price"], product["description"]]
  puts table_create.render(:ascii)
end

def destroy()
  puts "Enter an id of a product you want to delete:"
  id = gets.chomp.to_i
  response = HTTP.delete("http://localhost:3000/products/#{id}")
  puts "The product has been deleted."
end

index()
#show()
#create()
update()
#destroy()




