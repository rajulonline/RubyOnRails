class Posts < ActiveRecord::Migration
  
  def change
    add_column :posts,:avatar_file_name, :string
    add_column :posts,:avatar_content_type, :string
    add_column :posts,:avatar_file_size, :string
  end
end
