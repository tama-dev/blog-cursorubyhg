class User < ActiveRecord::Base
  attr_accessible :mail, :name, :password, :username
end
