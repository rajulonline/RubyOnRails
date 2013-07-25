class Status < ActiveRecord::Base
  attr_accessible :name
  
  has_many :posts
  belongs_to :defect
  has_many :projects
  has_many :requirements
end