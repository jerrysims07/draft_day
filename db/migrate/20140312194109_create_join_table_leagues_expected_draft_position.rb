class CreateJoinTableLeaguesExpectedDraftPosition < ActiveRecord::Migration
  def change
    create_join_table :leagues, :expected_draft_positions, table_name: :projections do |t|
      t.index [:league_id, :expected_draft_position_id]
      t.index [:expected_draft_position_id, :league_id]
      t.integer :total_pts
    end
  end
end
