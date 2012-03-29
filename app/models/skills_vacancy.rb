class SkillsVacancy < ActiveRecord::Base
  belongs_to :vacancy
  belongs_to :skill
  
  has_many :workers
end
