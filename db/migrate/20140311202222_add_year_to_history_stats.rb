class AddYearToHistoryStats < ActiveRecord::Migration
  def change
    add_column :history_stats, :year, :integer
  end
end
