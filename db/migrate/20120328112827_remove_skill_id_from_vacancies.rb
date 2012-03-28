class RemoveSkillIdFromVacancies < ActiveRecord::Migration
  def up
    remove_column :vacancies, :skill_id
  end

  def down
    add_column :vacancies, :skill_id, :integer
  end
end
