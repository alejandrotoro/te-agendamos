class SupportsController < ApplicationController
  
  def contact
    ContactMailer.support(params).deliver
    msg = "Tu mensaje ha sido enviado, muy pronto nuestro equipo se pondra en contacto."

    respond_to do |format|
      format.json { render :json => { :notice => msg } }
    end
  end
  
end
