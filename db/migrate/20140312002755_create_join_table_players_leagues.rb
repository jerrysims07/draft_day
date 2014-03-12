class CreateJoinTablePlayersLeagues < ActiveRecord::Migration
  def change
    create_join_table :players, :leagues, table_name: :predraft_rankings do |t|
      t.index [:player_id, :league_id]      
      t.index [:league_id, :player_id]
      t.integer "position_rank"
    end
  end
end
