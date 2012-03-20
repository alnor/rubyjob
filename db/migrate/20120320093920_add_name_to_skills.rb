class AddNameToSkills < ActiveRecord::Migration
  def self.up
    add_column :skills, :name, :string
  end

  def self.down
    remove_column :skills, :name
  end
end
