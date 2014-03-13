class AddConcatToPredraftRankings < ActiveRecord::Migration
  def change
    add_column :predraft_rankings, :concat, :string
  end
end
