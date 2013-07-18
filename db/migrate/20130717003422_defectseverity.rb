class Defectseverity < ActiveRecord::Migration
    def up
   create_table :defectseverities do |t|
      t.string :severity
    end
  end

  def down
  end
end
