class User < ActiveRecord::Base
  include Paperdragon::Model
  processable :avatar

  serialize :avatar_meta_data
  serialize :auth_meta_data
  has_many :posts
end # class User
