class Post < ActiveRecord::Base
  belongs_to :users
  belongs_to :conversations
end
