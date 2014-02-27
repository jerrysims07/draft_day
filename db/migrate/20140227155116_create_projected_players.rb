class CreateProjectedPlayers < ActiveRecord::Migration
  def change
    create_table :projected_players do |t|
      t.string :slot
      t.float :points

      t.timestamps
    end
  end
end
