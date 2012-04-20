 
class User < ActiveRecord::Base
  has_many :bookmarks
   
  attr_accessible :username, :realname, :email, :password, :password_confirmation

  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 
    validates :username, :presence => true,
                     :uniqueness => true,
                     :length => {:maximum => 100}
    
    validates :realname, :presence => true,
                     :length => {:minimum => 2, :maximum => 75}
                         
   validates :email, :presence => true,
                    :format => { :with => email_regex }
                    
    validates :password, :presence => true,
                         :confirmation => true,
                         :length => {:within => 7..40 }
                      

end


# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  username           :string(255)
#  realname           :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  salt               :string(255)
#  admin              :boolean
#  encrypted_password :string(255)
#

