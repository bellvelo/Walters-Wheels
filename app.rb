require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/items_controller')
require_relative('controllers/manufacturers_controller')
require_relative('controllers/stock_controller')

get '/' do # homepage
  erb(:index)
end
