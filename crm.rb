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

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  if @contact
    erb(:show_contact)
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
