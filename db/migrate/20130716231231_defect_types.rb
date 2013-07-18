class DefectTypes < ActiveRecord::Migration

  def up
   create_table :defecttypes do |t|
      t.string :type
      t.string :severity
    end
  end
end