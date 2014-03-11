class AddAvgPtsAllowedToHistoryStats < ActiveRecord::Migration
  def change
    add_column :history_stats, :avgPtsAllowed, :float
  end
end
