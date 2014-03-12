# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

csv_file_path = 'data/QB.csv'

CSV.foreach(csv_file_path) do |row|
  HistoryStat.create!({
    :position => "QB",
    :passYds => row[10],
    :passTDs => row[11],
    :intThrown => row[12],
    :rushYds => row[14],
    :rushTDs => row[15],
    :twoPt => row[16],
    :fumbLost => row[17],
    :year => row[19]
  })
end

csv_file_path = 'data/DEF.csv'

CSV.foreach(csv_file_path) do |row|
  HistoryStat.create!({
    :position => "DEF",
    :avgPtsAllowed => row[3],
    :defSack => row[5],
    :defINT => row[6],
    :defFumbRec => row[7],
    :defTD => row[14],
    :defSafety => row[15],
    :year => row[25]
  })
end

csv_file_path = 'data/K.csv'

CSV.foreach(csv_file_path) do |row|
  HistoryStat.create!({
    :position => "K",
    :fantasyPts => row[3],
    :year => row[17]
  })
end

csv_file_path = 'data/RB.csv'

CSV.foreach(csv_file_path) do |row|
  HistoryStat.create!({
    :position => "RB",
    :rushYds => row[8],
    :rushTDs => row[10],
    :recYds => row[12],
    :recTDs => row[13],
    :twoPt => row[20],
    :fumbLost => row[21],
    :year => row[22]
  })
end

csv_file_path = 'data/TE.csv'

CSV.foreach(csv_file_path) do |row|
  HistoryStat.create!({
    :position => "TE",
    :rushYds => row[13],
    :rushTDs => row[14],
    :recYds => row[9],
    :recTDs => row[11],
    :twoPt => row[19],
    :fumbLost => row[20],
    :year => row[21]
  })
end

csv_file_path = 'data/WR.csv'

CSV.foreach(csv_file_path) do |row|
  HistoryStat.create!({
    :position => "WR",
    :rushYds => row[14],
    :rushTDs => row[15],
    :recYds => row[10],
    :recTDs => row[12],
    :twoPt => row[20],
    :fumbLost => row[21],
    :year => row[22]
  })
end

csv_file_path = 'data/players.csv'

CSV.foreach(csv_file_path) do |row|
  Player.create!({
    :name => row[0],
    :position => row[1],
    :team => row[2]
  })
end

