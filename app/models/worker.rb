class Worker < ActiveRecord::Base
  has_many :skills_workers
  has_many :skills, :through => :skills_workers
  
  validate :name, :presence => true 
end
