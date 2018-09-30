require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/item')
require_relative('../models/manufacturer')
also_reload('./models/*')

get "/items" do  # index of items
  @manufacturers = Manufacturer.all
  @items = Item.all()
  erb (:"items/index")
end

get "/items/new" do # fetch form to create new record
  @manufacturers = Manufacturer.all
  erb(:"items/new")
end

get "/items/:id" do
  @item = Item.find(params[:id].to_i)
  erb(:"items/show")
end

post "/items"  do # create new record
  @item = Item.new(params)
  @item.save()
  redirect to("/items")
end

## update record ##

get "/items/:id/edit" do
  @manufacturers = Manufacturer.all
  @item = Item.find(params[:id])
  erb(:"items/edit")
end

post "/items/:id" do
  @item = Item.new(params)
  @item.update()
  redirect to("/items")
end

## delete records  ##

post "/items/:id/delete" do
  @item = Item.find(params[:id])
  @item.delete()
  redirect to("/items")
end
