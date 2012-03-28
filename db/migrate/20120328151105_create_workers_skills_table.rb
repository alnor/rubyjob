class CreateWorkersSkillsTable < ActiveRecord::Migration
  def self.up
    create_habtm_table :workers, :skills
  end

  def self.down
    drop_habtm_table :workers, :skills
  end
end
