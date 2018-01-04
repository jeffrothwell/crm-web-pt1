require_relative 'contact'
require 'sinatra'

get '/' do
  erb(:index)
end

get '/contacts' do
  @all_contacts = Contact.all
  erb(:contacts)
end

after do
  ActiveRecord::Base.connection.close
end
