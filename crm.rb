require 'sinatra'
require_relative 'contact.rb'

get '/' do
    @crm_app_name = "Meggy's CRM"
    erb :index
end

get '/contacts' do
    erb :contacts
end

get '/new_contact' do
    erb :new_contact
end

get '/show_contacts' do
    erb :show_contacts
end
get '/about' do
    erb :about
end

get '/edit_contact' do
    erb :edit_contact
end

post '/contacts' do
    Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
    redirect to(:contacts)
end

get '/contacts/:id' do
    @contact = Contact.find(params[:id].to_i)
        erb :show_contacts
end

get '/contacts/:id/edit' do
    @contact = Contact.find(params[:id].to_i)
 if @contact
   erb :edit_contact
 else
   raise Sinatra::NotFound
 end
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to('/contacts')
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
# class Time
#     Time.new(26, 10,2016).to_date
# end
