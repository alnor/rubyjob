class Skill < ActiveRecord::Base
  has_many :skills_vacancies
  has_many :vacancies, :through => :skills_vacancies
  
  has_many :skills_workers
  has_many :workers, :through => :skills_workers  
end
