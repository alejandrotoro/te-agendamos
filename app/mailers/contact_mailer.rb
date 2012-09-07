class ContactMailer < ActionMailer::Base
  def support(params)
    mail(
      :to => "contacto@sietecumbres.com.co", 
      :subject => "Te Agendamos Support <#{params[:email]}>", 
      :body => "#{params[:name]} has written #{params[:comment]}",
      :from => params[:email]
    )
  end
  
  def reminder(to, event, html)
    mail(
      :to => to,
      :subject => "Recordatorio para tu evento #{event}",
      :body => "Este es un recordatorio para el evento #{event}",
      :from => "contacto@sietecumbres.com.co"
    )
  end
  
end
