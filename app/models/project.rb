class Project < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :requirements, :foreign_key=>:project_id,:dependent => :destroy
  has_many :posts,:foreign_key=>:project_id,:dependent => :destroy
  has_many :defects, :foreign_key=>:project_id,:dependent => :destroy
  

end
