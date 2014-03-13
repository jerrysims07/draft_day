class RemoveColumnsFromExpectedDraftPosition < ActiveRecord::Migration
  def change
    remove_column :expected_draft_positions, :team, :string
    remove_column :expected_draft_positions, :player_name, :string
  end
end
