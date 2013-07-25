class Defect < ActiveRecord::Base
  attr_accessible :project_id,:req_id, :parent_tc_id, :def_description,:tester_name,:dev_name,:status,:category, :severity
 
   belongs_to :post,:dependent => :destroy
   belongs_to :requirement
   belongs_to :person
   belongs_to :project, :dependent => :destroy
   validates :project_id, :parent_tc_id, :def_description,:tester_name,:dev_name,:status,:presence => true
   
  # before_validation :ensure_form_has_values
#   
  # protected
  # def ensure_form_has_values
    # if project_id.blank?
      # errors.add('Testing')
    # end
  # end

end