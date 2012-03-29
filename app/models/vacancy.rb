class Vacancy < ActiveRecord::Base
  has_many :skills_vacancies
  has_many :skills, :through => :skills_vacancies
  
  validate :name, :presence => true 
  
  scope :active, where("lifetime < ?", Time.zone.now )

end
