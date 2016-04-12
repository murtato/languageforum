class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_and_belongs_to_many :conversations
  has_and_belongs_to_many :languages
  has_many :posts
end
