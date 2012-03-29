class AddUniqKeyToSkills < ActiveRecord::Migration
  def change
    add_index :skills, :name, :unique => true
  end
end
