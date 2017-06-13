class User < ActiveRecord::Base
  serialize :avatar_meta_data
  has_many :posts
end # class User
