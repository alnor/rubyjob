class CreateStatus < ActiveRecord::Migration
  def up
    create_table :status do |t|
      t.string :name

      t.timestamps
    end    
  end

  def down
  end
end
