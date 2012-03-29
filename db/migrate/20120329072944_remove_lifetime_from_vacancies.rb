class RemoveLifetimeFromVacancies < ActiveRecord::Migration
  def up
    remove_column :vacancies, :lifetime
  end

  def down
  end
end
