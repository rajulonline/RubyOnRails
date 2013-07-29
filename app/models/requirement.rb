class Requirement < ActiveRecord::Base
  attr_accessible :project_id,:parent_tc_id, :req_name,:req_description,:tester_assigned,:dev_assigned,:prod_owner,:status
  validates :req_description,:dev_assigned,:prod_owner,:status,:presence => true,:allow_nil => false
  belongs_to :project,:foreign_key=>:project_id
  has_many :posts,:foreign_key=>:req_id,:dependent=>:destroy
  has_many :defects,:foreign_key=>:req_id,:dependent=>:destroy
  

end