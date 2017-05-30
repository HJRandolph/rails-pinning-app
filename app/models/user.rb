class User < ActiveRecord::Base
  has_many :pins
  
  def self.authenticate(email,password)
  	
  end
end
