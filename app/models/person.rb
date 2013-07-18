class Person < ActiveRecord::Base
  attr_accessible :agent, :status
  has_many :post, :dependent=>:destroy
end