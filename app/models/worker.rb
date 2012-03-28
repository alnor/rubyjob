class Worker < ActiveRecord::Base
  has_many :skills_vacancies
  has_many :skills, :through => :skills_vacancies
  
  validate :name, :presence => true 
end
