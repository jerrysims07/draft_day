class CreateStatCats < ActiveRecord::Migration
  def change
    create_table :stat_cats do |t|
      t.string :name

      t.timestamps
    end
  end
end
