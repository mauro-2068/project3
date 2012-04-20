class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :User
     attr_accessible :url, :name
    
    validates :url, :presence => true,
                     :length => {:minimum => 10}
    
    validates :name, :presence => true,
                     :length => {:maximum => 100}
    
end