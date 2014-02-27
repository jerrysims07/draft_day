class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :team
      t.integer :position_rank

      t.timestamps
    end
  end
end
