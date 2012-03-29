class CahngeColumnStatusIdInWorkers < ActiveRecord::Migration
  def change

    rename_column :workers, :status_id, :status

  end

  def down
  end
end
