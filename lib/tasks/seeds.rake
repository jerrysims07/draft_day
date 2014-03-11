require 'csv'

namespace :csv do

  desc "Import CSV Player Data"
  task :import_Quarterbacks => :environment do

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
      puts "Row added!"
    end
  end

  task :import_Team_Defense => :environment do

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
  end
end




