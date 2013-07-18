class Status < ActiveRecord::Migration
  def change
    create_table :status do |t|
      t.string :name
      
  end
end
def up
  add_index :status, :name, unique: true
end
  def down
  end
end
