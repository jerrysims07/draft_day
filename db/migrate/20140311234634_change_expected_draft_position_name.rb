class ChangeExpectedDraftPositionName < ActiveRecord::Migration

  def self.up
      rename_table :table_expected_draft_positions, :expected_draft_positions
  end 
  def self.down
      rename_table :expected_draft_positions, :table_expected_draft_positions
  end
end
