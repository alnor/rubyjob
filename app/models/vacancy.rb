class Vacancy < ActiveRecord::Base
  has_many :skills_vacancies
  has_many :skills, :through => :skills_vacancies
  
  validates :name, :presence => true 
  validates :contacts, :format => { :with => /(^([a-z0-9_\-]+\.)*[a-z0-9_\-]+@([a-z0-9][a-z0-9\-]*[a-z0-9]\.)+[a-z]{2,4}$)|(^[0-9]+$)/,
    :message => "Only phone or email allowed" }

  scope :active, where("lifetime > ?", Time.zone.now )

end
