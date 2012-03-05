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