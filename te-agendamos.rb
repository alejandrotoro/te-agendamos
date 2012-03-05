require "rubygems"
require "bundler"
require "sinatra"

Bundler.setup

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