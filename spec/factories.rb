Factory.define :user do |user|
  user.username               'Gino Garcia'
  user.realname               'Gino Garcia'
  user.email                  'ginogarcia@netzero.net'  
  user.password               'foobars'
  user.password_confirmation  'foobars'  
end


Factory.sequence :username do |n|
  "person#{n}"
end
Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :bookmark do |bookmark|
  bookmark.url "http://flordelpalenque.com"
  bookmark.name "Flor Del Palenque"
  bookmark.association :user
end



