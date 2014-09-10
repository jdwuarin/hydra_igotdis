# somehow in there then included everywhere

shared_context "instance_variables" do
  before do

    @user = User.new(email: "test@sugarglider.com",
                     password: "test1234",
                     password_confirmation: "test1234")

    @other_user = User.new(email: "other_test@sugarglider.com",
                           password: "test1234",
                           password_confirmation: "test1234")

    @venue = Venue.new(name: "Example Venue")

    @tournament = Tournament.new(name: "Example Tournament",
                                 game_id: 1,
                                 start_date: DateTime.yesterday,
                                 end_date: DateTime.tomorrow,
                                 venue: @venue.id,
                                 continent_id: 1)

    @team_1 = Team.new(name: "Example Team_1",
                       continent_id: 1,
                       game_id: 1)
    @team_2 = Team.new(name: "Example Team_2",
                       continent_id: 1,
                       game_id: 1)

    @round = Round.new(tournament: @tournament,
                       round_type: 2,
                       points_multiplier: 2,
                       start_date: DateTime.yesterday + 1.hour,
                       end_date: DateTime.yesterday + 1.day,
                       is_direct_elimination_round: true,
                       receiving_contestant: @team_1,
                       invited_contestant: @team_2)

    @lol_results_format_1 = get_empty_LOL_results_format_1
    @lol_results_format_1["receiving_contestant"]["winner"] = false
    @lol_results_format_1["invited_contestant"]["winner"] = true

    @match = Match.new(round: @round,
                       date: DateTime.now,
                       receiving_contestant: @team_1,
                       invited_contestant: @team_2,
                       results: @lol_results_format_1)

    @player_position = PlayerPosition.new(match: @match,
                                          game_id: 1)

    @player_1 = Player.new(username: "Player_1",
                           first_name: "Example first name",
                           last_name: "Example last name",
                            player_position: @player_position,
                            date: Datetime.today - 8000,
                            continent_id: 1,
                            game_id: 1)
    @player_2 = Player.new(username: "Player_2",
                           first_name: "Example first name",
                           last_name: "Example last name",
                           player_position: @player_position,
                           date: Datetime.today - 8020,
                           continent_id: 1,
                           game_id: 1)
    @player_3 = Player.new(username: "Player_3",
                           first_name: "Example first name",
                           last_name: "Example last name",
                           player_position: @player_position,
                           date: Datetime.today - 9000,
                           continent_id: 1,
                           game_id: 1)
    @player_4 = Player.new(username: "Player_4",
                           first_name: "Example first name",
                           last_name: "Example last name",
                           player_position: @player_position,
                           date: Datetime.today - 7700,
                           continent_id: 1,
                           game_id: 1)

    @team_player_1 = TeamPlayer.new(team: @team_1,
                                    player: @player_1)
    @team_player_2 = TeamPlayer.new(team: @team_1,
                                    player: @player_2)
    @team_player_3 = TeamPlayer.new(team: @team_2,
                                    player: @player_3)
    @team_player_4 = TeamPlayer.new(team: @team_2,
                                    player: @player_4)

    # @user predicts @team_1 will win 3-0
    @user_round_prediction = UserRoundPrediction.new(
      round: @round,
      prediction_type: 6,
      predicted_contestant: @team_1,
      user_id: @user)

    # @other_user predicts @team_1 will win 3-1
    @other_user_round_prediction = UserRoundPrediction.new(
      round: @round,
      prediction_type: 7,
      predicted_contestant: @team_1,
      user_id: @other_user)


    # @user predicts @team_1 will have the First kill
    @user_match_prediction = UserMatchPrediction.new(
      match_id: @match,
      prediction_type: 1,
      predicted_contestant: @team_1,
      user_id: @user)

    # @user predicts @team_1 will have the First kill
    @user_match_other_prediction = UserMatchPrediction.new(
      match_id: @match,
      prediction_type: 3,
      predicted_contestant: @team_1,
      user_id: @user)

    # @other_user predicts @team_1 will have the first tower
    @other_user_match_prediction = UserMatchPrediction.new(
      match_id: @match,
      prediction_type: 4,
      predicted_contestant: @team_1,
      user_id: @other_user)

    # @other_user predicts @team_1 will have the first inhibitor
    @other_user_match_other_prediction = UserMatchPrediction.new(
      match_id: @match,
      prediction_type: 5,
      predicted_contestant: @team_1,
      user_id: @other_user)

    @user_tournament_point_standing = UserTournamentPointStading(
      user: @user,
      tournament: @tournament)

    @other_user_tournament_point_standing = UserTournamentPointStading(
      user: @other_user,
      tournament: @tournament)

  end
end



