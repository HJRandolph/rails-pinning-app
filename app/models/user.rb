class User < ActiveRecord::Base
  has_secure_password
    attr_accessor :email, :password
  	has_many :pins


#def authenticate(email)
#	@user = User.find_by_email(email)
#end
 
 
  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if not @user.nil?
        if @user.authenticate(password)
            return @user
        end
    end
    return nil
end



####################### The Last End #######################
end