class Vacancy < ActiveRecord::Base
  has_and_belongs_to_many :skill
  
  validate :name, :presence => true
  validate :skill, :presence => true  
end
