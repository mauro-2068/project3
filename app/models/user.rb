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

class User < ActiveRecord::Base
    has_many :bookmarks
    
      attr_accessor :password
  attr_accessible :username, :realname, :email, :password , :password_confirmation
  
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 
    validates :username, :presence => true, :uniqueness => true,
                                            :length => {:maximum => 100}
    
    validates :realname, :presence => true,
                         :length => {:minimum => 2, :maximum => 75}
                         
    validates :email,     :presence => true,
                         :format => { :with => email_regex }
                    
    validates :password, :presence => true, :confirmation => true,
                         :length => {:within => 7..40 }
    ##
    before_save :encrypt_password
  
    def has_password?(submitted_password)
      encrypted_password == encrypt(submitted_password)
    end
    ####
    
    class << self
      def User.authenticate(email, submitted_password)
        user = find_by_email(email)
        return nil  if user.nil?
        return user if user.has_password?(submitted_password)
      end
      ####
      def User.authenticate_with_salt(id, cookie_salt)
          user = find_by_id(id)
          (user && user.salt == cookie_salt) ? user : nil
      end
    end
    ####
   private
     def encrypt_password
        self.salt = make_salt if new_record?
        self.encrypted_password = encrypt(password)
     end
     ###
     
     def encrypt(string)
        secure_hash("#{salt}--#{string}")
     end
     ####
     def make_salt
       secure_hash("#{Time.now.utc}--#{password}")
     end
     ####
     def secure_hash(string)
      Digest::SHA2.hexdigest(string) 
     end
end

