class Requirement < ActiveRecord::Base
  attr_accessible :project_id,:parent_tc_id, :title,:req_description,:tester_assigned,:dev_assigned,:prod_owner,:status
  validates :req_description,:dev_assigned,:prod_owner,:status,:presence => true,:allow_nil => false
  
  belongs_to :project, :dependent=>:destroy
  has_many :posts,:dependent=>:destroy
  has_many :defects,:dependent=>:destroy
  

end