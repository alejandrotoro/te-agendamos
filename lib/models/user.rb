class User
  include Mongoid::Document
  
  field :email
  field :name
  field :last_name
  field :password
  
  attr_accessor :password
  
  def self.find_by_email(email)
    where(:email => email).first
  end
end