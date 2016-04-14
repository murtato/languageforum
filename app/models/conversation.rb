class Conversation < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :language
  has_many :posts, dependent: :destroy
  # add relations here
end
