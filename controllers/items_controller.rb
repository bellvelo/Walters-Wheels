require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/item')
require_relative('../models/manufacturer')
also_reload('./models/*')

get "/items" do
  @manufacturers = Manufacturer.all
  if params[:manufacturer_id]
    @items = Item.get_by_man(params[:manufacturer_id])
  elsif params[:search_input]
    @items = Item.search_items(params[:search_input])
  else
    @items = Item.all
  end
erb (:"items/index")
end

get "/items" do
  @manufacturers = Manufacturer.all
  if params[:manufacturer_id]
    @items = Item.get_by_man(params[:manufacturer_id])
  else
    @items = Item.all()
  end
  erb(:"items/index")
end

get "/items/new" do
  @manufacturers = Manufacturer.all
  @items = Item.all()
  erb(:"items/new")
end

get "/items/:id" do
  @manufacturers = Manufacturer.all
  @item = Item.find(params[:id].to_i)
  erb(:"items/show")
end

post "/items"  do
  @manufacturers = Manufacturer.all
  @item = Item.new(params)
  @item.save()
  redirect to("/items")
end

get "/items/:id/edit" do
  @manufacturers = Manufacturer.all
  @item = Item.find(params[:id])
  erb(:"items/edit")
end

post "/items/:id" do
  @manufacturers = Manufacturer.all
  @item = Item.new(params)
  @item.update()
  redirect to("/items")
end

post "/items/:id/delete" do
  @item = Item.find(params[:id])
  @item.delete()
  redirect to("/items")
end
