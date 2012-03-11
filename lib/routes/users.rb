get '/users/new' do
  haml :'users/new', { :layout => :'layouts/application' }
end

post '/login' do
  user = User.where(:email => params[:email], :password => params[:password])
  if user
    redirect '/users/dashboard'
  else
    redirect '/'
  end
end

get '/users/dashboard' do
  haml :"users/dashboard", { :layout => :'layouts/application' }
end

post '/users/register' do
  response = {:error => true}
  if User.find_by_email(params[:user][:email]).to_s
    response[:message] = "Esta cuenta de correo ya se encuentra registrada."
  end
  if params[:user][:password] != params[:password_confirm]
    response[:message] = "Por favor escribe la misma contrasena."
  end
  
  response[:complete] = (!params[:user][:email].empty? and !params[:user][:name].empty? and !params[:user][:last_name].empty? and !params[:user][:password].empty? and !params[:password_confirm].empty?)
  
  if response[:complete]
    user = User.new(params[:user])
    user.save
    response[:message] = "Tu cuenta en Te Agendamos ha sido creada exitosamente."
    response[:error] = false
    redirect '/users/dashboard'
  else
    response[:message] = "Todos los campos deben ser diligenciados."
  end
end