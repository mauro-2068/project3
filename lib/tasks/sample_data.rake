require 'faker'

namespace :db do
    desc "Fill database with sample data"
    task :populate => :environment do
        Rake::Task['db:reset'].invoke
        admin = User.create!(:username => "Example User",
                             :realname => "Gino Garcia",
                             :email => "ginogarica@netzero.net",
                             :password => "foobars",
                             :password_confirmation => "foobars")
        admin.toggle!(:admin)    
        
        99.times do |n|
            username = Faker::Name.name
            realname = Faker::Name.name
            email = "example-#{n+1}@railstutorial.org"
            password = "password"
            User.create!(:username => username,
                         :realname => realname,
                         :email => email,
                         :password => password,
                         :password_confirmation => password)
        end
        
        User.all(:limit => 6).each do |user|
            50.times do
                dName   = Faker::Internet.domain_name
                dSuffix = Faker::Internet.domain_suffix
                dWord   = Faker::Internet.domain_word
                url     = "http://"+ dName +"_" + dWord + "." + dSuffix 
                name = Faker::Name.name
                user.bookmarks.create!(:url => url, :name => name)
            end
        end
     end
end