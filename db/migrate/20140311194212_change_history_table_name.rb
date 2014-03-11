class ChangeHistoryTableName < ActiveRecord::Migration

  def self.up
      rename_table :history_stats_tables, :history_stats
  end 
  def self.down
      rename_table :history_stats, :history_stats_tables
  end
end
