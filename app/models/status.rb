class Status < ActiveRecord::Base
  attr_accessible :name
  
  has_many :posts
  has_many :defects
  has_many :projects
  has_many :requirements
end