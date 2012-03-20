class ActiveRecord::Migration
  # create_habtm_table :posts, :tags
  def self.create_habtm_table(first_model,second_model)
    table_name = [first_model.to_s,second_model.to_s].sort.join('_').to_sym
    create_table table_name, :id => false do |t|
      t.belongs_to first_model.to_s.singularize.to_sym
      t.belongs_to second_model.to_s.singularize.to_sym
    end
    add_index table_name, (first_model.to_s.singularize+'_id').to_sym
    add_index table_name, (second_model.to_s.singularize+'_id').to_sym
  end
 
  # drop_habtm_table :posts, :tags
  def self.drop_habtm_table(first_model, second_model)
    table_name = [first_model.to_s,second_model.to_s].sort.join('_').to_sym
    drop_table table_name
  end
end