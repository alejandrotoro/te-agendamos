require "rubygems"
require "bundler"
require "sinatra"
require 'mongoid'
Bundler.require

$:.push(File.dirname File.expand_path __FILE__)

%w(users.rb providers.rb).each do |r|
  require "lib/models/#{r}"
end

#Configuration

Mongoid.configure do |config|
  if ENV['MONGOHQ_URL']
    conn = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
    uri = URI.parse(ENV['MONGOHQ_URL'])
    config.master = conn.db(uri.path.gsub(/^\//, ''))
  else
    config.master = Mongo::Connection.from_uri("mongodb://localhost:27017").db('te_agendamos')
  end
end

configure do
  set :haml, {:format => :html5, :escape_html => true}
end

get "/" do
  haml :index, { :layout => :'layouts/application' }
end

post "/contact" do
  require 'pony'
  require 'json'
  content_type :json
  
  response = {:error => true}
  response[:complete] = (!params[:email].empty? and !params[:comment].empty? and !params[:name].empty?)
  
  if response[:complete]
    Pony.mail(
      :from => "#{params[:name]} <#{params[:email]}>",
      :to => "contacto@sietecumbres.com.co",
      :subject => "#{params[:name]} ha enviado un mensaje de contacto.",
      :body => params[:comment],
      :port => "587",
      :via => :smtp,
      :via_options => {
        :address              => "smtp.gmail.com",
        :port                 => "587",
        :enable_starttls_auto => true,
        :user_name            => "contacto@sietecumbres.com.co",
        :password             => "contacto7cumbres",
        :authentication       => "plain",
        :domain               => "sietecumbres.com.co"
      }
    )
    response[:message] = "El mesaje se ha enviado con exito. Muchas gracias por contactarse con nosotros."
    response[:error] = false
  else
    response[:message] = "Todos los campos deben ser diligenciados."
  end
  
  response.to_json
end