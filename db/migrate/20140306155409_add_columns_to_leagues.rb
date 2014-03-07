class AddColumnsToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :passTDs, :integer
    add_column :leagues, :passYds, :integer
    add_column :leagues, :intThrown, :integer
    add_column :leagues, :rushTDs, :integer
    add_column :leagues, :rushYds, :integer
    add_column :leagues, :recTDs, :integer
    add_column :leagues, :recYds, :integer
    add_column :leagues, :twoPt, :integer
    add_column :leagues, :retTDs, :integer
    add_column :leagues, :fumbLost, :integer
    add_column :leagues, :FG50up, :integer
    add_column :leagues, :FG40to49, :integer
    add_column :leagues, :FG39down, :integer
    add_column :leagues, :PAT, :integer
    add_column :leagues, :FGmissed, :integer
    add_column :leagues, :defTD, :integer
    add_column :leagues, :defINT, :integer
    add_column :leagues, :defFumbRec, :integer
    add_column :leagues, :defBlock, :integer
    add_column :leagues, :defSafety, :integer
    add_column :leagues, :defSack, :integer
    add_column :leagues, :ptsAllowed0, :integer
    add_column :leagues, :ptsAllowed1to6, :integer
    add_column :leagues, :ptsAllowed7to13, :integer
    add_column :leagues, :ptsAllowed14to20, :string
    add_column :leagues, :ptsAllowed21to27, :string
    add_column :leagues, :ptsAllowed28to34, :string
    add_column :leagues, :ptsAllowed35to45, :string
    add_column :leagues, :ptsAllowed46plus, :integer
  end
end
