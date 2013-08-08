class Project < ActiveRecord::Base
  attr_accessible :name, :description,:avatar
  has_attached_file :avatar,:styles => { :small => "100x100>" },:url  => "/assets/images/:basename.:extension"

  has_many :requirements, :foreign_key=>:project_id,:dependent => :destroy
  has_many :posts,:foreign_key=>:project_id,:dependent => :destroy
  has_many :defects, :foreign_key=>:project_id,:dependent => :destroy

  validates :name,:description, :presence => true

end
