require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/item')
require_relative('../models/manufacturer')
also_reload('./models/*')
