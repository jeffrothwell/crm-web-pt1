require_relative 'contact'
require 'sinatra'

get '/' do
  erb(:index)
end
