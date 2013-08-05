class Defect < ActiveRecord::Base
  attr_accessible :project_id,:req_id, :parent_tc_id, :def_description,:tester_name,:dev_name,:status,:category, :severity,:req_name,:req_id
 
   belongs_to :post,:foreign_key=>:parent_tc_id
   belongs_to :requirement,:foreign_key=>:req_id
 
   # belongs_to :project, :dependent => :destroy
   validates :project_id, :def_description,:tester_name,:dev_name,:status,:category, :severity,:presence => true
   
  # before_validation :ensure_form_has_values
#   
  # protected
  # def ensure_form_has_values
    # if project_id.blank?
      # errors.add('Testing')
    # end
  # end

end