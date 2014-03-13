class RemovePositionfromPredraftRankings < ActiveRecord::Migration
  def change
    remove_column :predraft_rankings, :position, :integer
    add_column :predraft_rankings, :position, :string

  end
end
