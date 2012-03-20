class CreateVacanciesSkillsTable < ActiveRecord::Migration
  def self.up
    create_habtm_table :vacancies, :skills
  end

  def self.down
    drop_habtm_table :vacancies, :skills
  end
end
