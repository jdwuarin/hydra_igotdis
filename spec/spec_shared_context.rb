# somehow in there then included everywhere

shared_context "instance_variables" do
  before do

    @user = User.new(email: "test@sugarglider.com",
                     password: "test1234",
                     password_confirmation: "test1234")

    @venue = Venue.new(name: "Example Venue")

    @tournament = Tournament.new(name: "Example Tournament",
                                 game_id: 1,
                                 start_date: DateTime.yesterday,
                                 end_date: DateTime.tomorrow,
                                 venue_id: @venue.id,
                                 continent_id: 1)

    @team_1 = Team.new(name: "Example Team",
                     continent_id: 1,
                     game_id: 1)
    @team_2 = Team.new(name: "Example Team",
                     continent_id: 1,
                     game_id: 1)

    @match = Match.new(tournament_id: @tournament,
                       date: DateTime.now,
                       finished: false,
                       receiving_contestant: team_1,
                       invited_contestant: team_2,
                       results: {})

    @player_position = PlayerPosition.new(match_id: @match,
                                          game_id: 1)

    @player_1 = Player.new(user_name: "Player_1",
                                 first_name: "Example first name",
                                 last_name: "Example last name",
                                 player_position_id: @player_position,
                                 date: Datetime.today - 1000,
                                 continent_id: 1,
                                 game_id: 1)
    @player_2 = Player.new(user_name: "Player_2",
                                 first_name: "Example first name",
                                 last_name: "Example last name",
                                 player_position_id: @player_position,
                                 date: Datetime.today - 1000,
                                 continent_id: 1,
                                 game_id: 1)
    @player_3 = Player.new(user_name: "Player_3",
                                 first_name: "Example first name",
                                 last_name: "Example last name",
                                 player_position_id: @player_position,
                                 date: Datetime.today - 1000,
                                 continent_id: 1,
                                 game_id: 1)
    @player_4 = Player.new(user_name: "Player_4",
                                 first_name: "Example first name",
                                 last_name: "Example last name",
                                 player_position_id: @player_position,
                                 date: Datetime.today - 1000,
                                 continent_id: 1,
                                 game_id: 1)

    @team_player_1 = TeamPlayer.new(team_id: @team_1,
                                    player_id: @player_1)
    @team_player_2 = TeamPlayer.new(team_id: @team_1,
                                    player_id: @player_2)
    @team_player_3 = TeamPlayer.new(team_id: @team_2,
                                    player_id: @player_3)
    @team_player_4 = TeamPlayer.new(team_id: @team_2,
                                    player_id: @player_4)

    @prediction = Prediction.new(match_id: @match,
                                 prediction_type: 1,
                                 predicted_contestant_type: Team,
                                 predicted_contestant_id: @team_1,
                                 user_id: @user)

    @user_tournament_point_standing = UserTournamentPointStading(
      user_id: @user,
      tournament_id: @tournament)

  end
end



