require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/item')
require_relative('../models/manufacturer')
also_reload('./models/*')

get "/stock" do
  @items = Item.stock_warn()
  @manufacturers = Manufacturer.all()
  erb(:"stock/index")
end

get "/profits" do
  @items = Item.all()
  @manufacturers = Manufacturer.all()
  erb(:"profits/index")
end
