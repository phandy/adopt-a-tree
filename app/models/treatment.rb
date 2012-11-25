class Treatment < ActiveRecord::Base
  attr_accessible :name
  has_many :trees
end
