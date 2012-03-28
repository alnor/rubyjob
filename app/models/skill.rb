class Skill < ActiveRecord::Base
  has_many :skills_vacancies
  has_many :vacancies, :through => :skills_vacancies
end
