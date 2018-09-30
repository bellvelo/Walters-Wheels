require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/item')
require_relative('../models/manufacturer')
also_reload('./models/*')

get "/stock" do
  erb(:"stock/index")
end

get "/profits" do
  erb(:"profits/index")
end
