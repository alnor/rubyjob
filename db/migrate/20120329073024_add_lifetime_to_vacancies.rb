class AddLifetimeToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :lifetime, :date
  end
end
