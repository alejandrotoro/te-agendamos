get '/users/new' do
  haml :'users/new', { :layout => :'layouts/application' }
end

post '/login' do
  user = User.where(:email => params[:email], :password => params[:password])
  if user
    redirect '/users/dashboard', { :layout => :'layouts/application' }
  else
    redirect 'index', { :layout => :'layouts/application' }
  end
end

get '/users/dashboard' do
  haml :"users/dashboard"
end

post '/users/register' do
  response = {:error => true}
  if User.find_by_email(params[:email])
    response[:message] = "Esta cuenta de correo ya se encuentra registrada."
  end
  if params[:password] != params[:password_confirm]
    response[:message] = "Por favor escribe la misma contrasena."
  end
  
  response[:complete] = (!params[:email].empty? and !params[:name].empty? and !params[:last_name].empty? and !params[:password].empty? and !params[:password_confirm].empty?)
  
  if response[:complete]
    User.create(:name => params[:name], :last_name => params[:last_name], :email => params[:email], :password => params[:password])
    response[:message] = "Tu cuenta en Te Agendamos ha sido creada exitosamente."
    response[:error] = false
    redirect '/users/dashboard', { :layout => :'layouts/application' }
  else
    response[:message] = "Todos los campos deben ser diligenciados."
  end
end