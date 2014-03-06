# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


game_list = [
  [1, "LOL"],
  [2, "DOTA"],
  [3, "Starcraft"]
]

Game.destroy_all
game_list.each do |seed, name|
  Game.create( id: seed, name: name )
end

continent_list = [
	[1, "Asia"],
	[2, "Africa"],
	[3, "North America"],
	[4, "South America"],
	[5, "Antarctica"],
	[6, "Europe"],
	[7, "Australia"]
]

Continent.destroy_all
continent_list.each do |seed, name|
  Continent.create( id: seed, name: name )
end