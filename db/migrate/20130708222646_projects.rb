class Projects < ActiveRecord::Migration
  def up
    create_table :projects do |t|

      t.string :name
      t.text :description
      t.attachment :avatar

      t.timestamps
    end

  end

  def change
   
    add_column :projects,:audio_file_name, :string
    add_column :projects,:audio_content_type, :string
    add_column :projects,:audio_file_size, :string
  end
  def down
     remove_column :projects,:audio, :string
  end
end