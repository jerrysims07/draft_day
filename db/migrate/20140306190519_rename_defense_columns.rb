class RenameDefenseColumns < ActiveRecord::Migration
  def change
    rename_column :leagues, :ptsAllowed14to20, :ptsAllowed14to17
    rename_column :leagues, :ptsAllowed21to27, :ptsAllowed18to27
  end
end
