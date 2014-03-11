class AddFantasyPtsToHistoryStats < ActiveRecord::Migration
  def change
    add_column :history_stats, :fantasyPts, :integer
  end
end
