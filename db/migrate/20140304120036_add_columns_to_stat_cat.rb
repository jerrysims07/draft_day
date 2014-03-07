class AddColumnsToStatCat < ActiveRecord::Migration
  def change
    add_column :stat_cats, :standardScore, :integer
    add_column :stat_cats, :threshold, :integer
    add_column :stat_cats, :units, :string
  end
end
