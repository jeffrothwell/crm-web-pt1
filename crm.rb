require_relative 'contact'
require 'sinatra'

get '/' do
  erb(:index)
end

get '/contacts' do
  @all_contacts = Contact.all.order("last_name")
  erb(:contacts)
end

get '/about_me' do
  erb(:about_me)
end

get '/contacts/new' do
  erb(:new)
end

post '/contacts' do
  Contact.create(
      first_name: params[:first_name],
      last_name:  params[:last_name],
      email:      params[:email],
      note:       params[:note]
    )
  redirect to('/contacts')
end

get '/contacts/search' do
  erb :search
end

get '/contacts/search-by' do
  # "GET request: #{params}"
  if params[:attribute] == "name"
    @contact = Contact.find_by(first_name: params[:query]) || Contact.find_by(last_name: params[:query])
  elsif params[:attribute] == "email"
    @contact = Contact.find_by(email: params[:query])
  end
  if @contact
    erb :show_contact
  else
    "No such contact"
  end
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  if @contact
    erb(:show_contact)
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    @contact.update(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
    )

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/delete' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    erb :delete
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
