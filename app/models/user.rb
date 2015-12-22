class User < ActiveRecord::Base
  has_many :events
  
  def first_and_last_name    
    "#{self.fname} " " #{self.lname}"    
  end
  
end
