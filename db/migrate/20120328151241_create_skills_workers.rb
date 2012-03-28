class CreateSkillsWorkers < ActiveRecord::Migration
  def change
    create_table :skills_workers do |t|

      t.timestamps
    end
  end
end
