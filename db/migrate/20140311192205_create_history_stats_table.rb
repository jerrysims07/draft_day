class CreateHistoryStatsTable < ActiveRecord::Migration
  def change
    create_table :history_stats_tables do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "passTDs"
      t.integer  "passYds"
      t.integer  "intThrown"
      t.integer  "rushTDs"
      t.integer  "rushYds"
      t.integer  "recTDs"
      t.integer  "recYds"
      t.integer  "twoPt"
      t.integer  "retTDs"
      t.integer  "fumbLost"
      t.integer  "FG50up"
      t.integer  "FG40to49"
      t.integer  "FG39down"
      t.integer  "PAT"
      t.integer  "FGmissed"
      t.integer  "defTD"
      t.integer  "defINT"
      t.integer  "defFumbRec"
      t.integer  "defBlock"
      t.integer  "defSafety"
      t.integer  "defSack"
      t.integer  "ptsAllowed0"
      t.integer  "ptsAllowed1to6"
      t.integer  "ptsAllowed7to13"
      t.string   "ptsAllowed14to17"
      t.string   "ptsAllowed18to27"
      t.string   "ptsAllowed28to34"
      t.string   "ptsAllowed35to45"
      t.integer  "ptsAllowed46plus"
    end
  end
end
