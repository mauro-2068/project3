require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
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

