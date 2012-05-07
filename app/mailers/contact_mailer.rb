class ContactMailer < ActionMailer::Base
  def support(params)
    mail(
      :to => "alejandrotoro@sietecumbres.com.co", 
      :subject => "Te Agendamos Support <#{params[:email]}>", 
      :body => "#{params[:name]} has written #{params[:comment]}",
      :from => params[:email]
    )
  end
end