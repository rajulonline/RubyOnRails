class Projects < ActiveRecord::Migration
  def up
   create_table :projects do |t|
      
      t.string :name
      t.text :description
      t.attachment :avatar
 
      t.timestamps
    end
  end
  
end