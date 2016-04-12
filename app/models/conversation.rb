class Conversation < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :languages
  has_many :posts
  # add relations here
end
