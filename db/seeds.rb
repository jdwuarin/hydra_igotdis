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

game_list.each do |seed, name|
  Game.find_or_create_by( id: seed, name: name )
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

continent_list.each do |seed, name|
  Continent.find_or_create_by( id: seed, name: name )
end

Venue.find_or_create_by(id: 1, name: "Awesome J-D Arena")

t = Tournament.find_or_create_by( id: 1, name: "dummy_tournament",
 venue_id: 1, game_id: 1, continent_id: 1 )
t.start_date = Time.now
t.end_date = Time.now+7.days
t.save

m = Match.find_or_create_by( id: 1, tournament_id: 1)
m.date = Time.now-1.day
m.save
m = Match.find_or_create_by( id: 2, tournament_id: 1)
m.date = Time.now+1.day
m.save
m = Match.find_or_create_by( id: 3, tournament_id: 1)
m.date = Time.now+2.day
m.save
m = Match.find_or_create_by( id: 4, tournament_id: 1)
m.date = Time.now+3.day
m.save
m = Match.find_or_create_by( id: 5, tournament_id: 1)
m.date = Time.now+4.day
m.save
m = Match.find_or_create_by( id: 6, tournament_id: 1)
m.date = Time.now+5.day
m.save


player1 = Player.find_or_create_by( id: 1, user_name: "J-D", game_id: 1)
player2 = Player.find_or_create_by( id: 2, user_name: "J-D foe", game_id: 1)
Player.find_or_create_by( id: 3, user_name: "Some other guy", game_id: 1)

Team.find_or_create_by( id: 1, name: "Awesome random team", continent_id: 1, game_id: 1)

MatchResult.find_or_create_by( 
	id: 1, match_id: 1, 
	contestant_id: player1.id, oponent_id: player2.id,
	contestant_type: player1.class.name, oponent_type: player2.class.name)

Bet.find_or_create_by(
	odds: "3:1", bet_size: 10, 
	match_id: 1, winner_id: 2, 
	winner_type: Player.name, 
	user_id: 1)

# params = { match: {id: 7, tournament_id: 1, match_results_attributes: [{ match_id: 7, contestant_id: player1.id, oponent_id: player2.id, contestant_type: player1.class.name, oponent_type: player2.class.name}]}}

# for activeadmin user
# AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')

