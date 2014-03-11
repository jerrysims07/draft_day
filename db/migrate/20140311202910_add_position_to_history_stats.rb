class AddPositionToHistoryStats < ActiveRecord::Migration
  def change
    add_column :history_stats, :position, :string
  end
end
