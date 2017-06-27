class User < ActiveRecord::Base
  attr_accessor :email, :password
  has_many :pins
  has_secure_password

#def authenticate(email)
#	@user = User.find_by_email(email)
#end
 
 
  def self.authenticate(email,password)
  	@user = User.find_by_email(email)
  	if !@user.nil?
  		if @user.authenticate(password)
  			return @user
  		end
  	end
  	return nil
  end


####################### The Last End #######################
end