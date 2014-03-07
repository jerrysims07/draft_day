# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
statCats = StatCat.create([{name: "passTDs", standardScore: 4, threshold: 1, units: "TD"}, {name: "passYds", standardScore: 1, threshold: 25, units: "Yards"}])
statCats.each {|sc| sc.save}
