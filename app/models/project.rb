class Project < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :requirements, :dependent => :destroy
  has_many :defects, :foreign_key=>:project_id,:dependent => :destroy
  has_many :posts,:foreign_key=>:project_id,:dependent => :destroy
  has_many :logins,:foreign_key=>:parent_tc_id,:dependent => :destroy
 
end
