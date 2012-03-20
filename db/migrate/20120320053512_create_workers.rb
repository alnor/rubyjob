class CreateWorkers < ActiveRecord::Migration
  def self.up
    create_table :workers do |t|
      t.text :name
      t.integer :salary
      t.string :contacts
      t.integer :status_id
      t.integer :skill_id

      t.timestamps
    end
  end

  def self.down
    drop_table :workers
  end
end
