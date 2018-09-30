require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/item')
require_relative('../models/manufacturer')
also_reload('./models/*')

get "/manufacturers" do  # index of items
  @manufacturers = Manufacturer.all()
    erb (:"manufacturers/index")
end

get "/manufacturers/new" do
  erb(:"manufacturers/new")
end

get "/manufacturers/:id" do
  @manufacturer = Manufacturer.find(params[:id])
  erb(:"manufacturers/show")
end

post "/manufacturers" do
  @manufacturer = Manufacturer.new(params)
  @manufacturer.save()
  redirect to("/manufacturers")
end

get "/manufacturers/:id/edit" do
  @manufacturer = Manufacturer.find(params[:id])
  erb(:"manufacturers/edit")
end

post '/manufacturers/:id' do
  @manufacturer = Manufacturer.new(params)
  @manufacturer.update()
  redirect to("/manufacturers")
end

post '/manufacturers/:id/delete' do
  @manufacturer = Manufacturer.find(params[:id])
  @manufacturer.delete()
  redirect to("/manufacturers")
end
