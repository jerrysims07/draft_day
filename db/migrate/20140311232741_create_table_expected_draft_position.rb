class CreateTableExpectedDraftPosition < ActiveRecord::Migration
  def change
    create_table :table_expected_draft_positions do |t|
      t.integer   "projection"
      t.datetime  "created_at"
      t.datetime  "updated_at"
      t.string    "player_name"
      t.string    "position"
      t.string    "team"
      t.string    "position_rank"
    end
  end
end
