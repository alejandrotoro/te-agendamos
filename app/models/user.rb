class User < ActiveRecord::Base
  devise :omniauthable, :database_authenticatable, :registerable

  validates :email, :presence => true
  validates :email, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}

  # -- mass-assignment rules --
  attr_protected :admin, :created_at, :updated_at

  #Be sure to create the users with the info you need.
  #Note that facebook and gmail will give you different info from users
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.info

    logger.info data.to_yaml
    
    if user = User.where(:email => data["email"]).first
      user.name = data["name"]
      user.save
      user
    else # Create a user with a stub password.
      User.create!(:email => data["email"], :name => data["name"])
    end
  end

  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token.info

    logger.info data.to_yaml

    if user = User.where(:email => data["email"]).first
      user.name = data["name"]
      user.save
      user
    else
      User.create!(:email => data["email"], :name => data["name"])
    end
  end
end
