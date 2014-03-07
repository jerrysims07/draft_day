class DropStatCatsTable < ActiveRecord::Migration
  def up
    drop_table :stat_cats 
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
