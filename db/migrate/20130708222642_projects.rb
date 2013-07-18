class Projects < ActiveRecord::Migration
  def up
   create_table :projects do |t|
      t.integer :project_id
      t.string :name
      t.text :description
      
 
      t.timestamps
    end
  end
end