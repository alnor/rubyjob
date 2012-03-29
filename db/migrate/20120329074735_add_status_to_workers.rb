class AddStatusToWorkers < ActiveRecord::Migration
  def change
    remove_column :workers, :status
    add_column :workers, :status, :string
  end
end
