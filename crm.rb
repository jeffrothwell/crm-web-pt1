require_relative 'contact'
require 'sinatra'

get '/' do
  erb(:index)
end

get '/contacts' do
  @all_contacts = Contact.all
  erb(:contacts)
end

get '/about_me' do
  erb(:about_me)
end

after do
  ActiveRecord::Base.connection.close
end
