class Post < ActiveRecord::Base
  
  attr_accessible :project_id,:parent_tc_id,:content, :agent, :title, :status,:req_name,:req_id
  # belongs_to :person
  belongs_to :project,:foreign_key=>:project_id
  belongs_to :requirement,:foreign_key=>:req_id
  has_many :childrens, :foreign_key=>:parent_tc_id,:dependent => :destroy
  has_many :defects,:foreign_key=>:parent_tc_id,:dependent => :destroy
  
  # validates_each :name, :agent,:title,:status do |record, attr, value|
    # record.errors.add(attr, 'must start with upper case') if value =~ /\A[a-z]/
  validates :agent,  :format => { :with => /\A[a-zA-Z]+\z/,
    :message => "Only letters allowed" }

    #,:uniqueness => { :case_sensitive => false }
   # before_validation :ensure_agent_has_a_value
  validates :content,:title, :status,:presence => true
 
    # protected
  # def ensure_agent_has_a_value
    # if agent.blank?
      # self.agent = title unless title.blank?
    # end
    # end
    
    def display_parent_child_test_cases
      
    end
    
    def self.all_cached
    Rails.cache.fetch('Post.all'){all}
  end

end
