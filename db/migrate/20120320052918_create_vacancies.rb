class CreateVacancies < ActiveRecord::Migration
  def self.up
    create_table :vacancies do |t|
      t.text :name
      t.integer :lifetime
      t.integer :salary
      t.string :contacts
      t.integer :skill_id

      t.timestamps
    end
  end

  def self.down
    drop_table :vacancies
  end
end
