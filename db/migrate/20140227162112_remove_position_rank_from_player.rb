class RemovePositionRankFromPlayer < ActiveRecord::Migration
  def change
    remove_column :players, :position_rank, :integer
  end
end
