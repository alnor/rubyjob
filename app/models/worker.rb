class Worker < ActiveRecord::Base
  has_many :skills_workers
  has_many :skills, :through => :skills_workers
  
  validates :name, :presence => true 
  validates :contacts, :format => { :with => /(^([a-z0-9_\-]+\.)*[a-z0-9_\-]+@([a-z0-9][a-z0-9\-]*[a-z0-9]\.)+[a-z]{2,4}$)|(\d+)/,
    :message => "Only phone or email allowed" }  
    
  validates :name, :format => { :with => /^[а-яА-ЯёЁ ]+$/,
    :message => "Only russian symbols allowed" }   
     
end
