class AddPositionToPredraftRankings < ActiveRecord::Migration
  def change
    add_column :predraft_rankings, :position, :integer
  end
end
