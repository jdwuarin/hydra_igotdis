module UserTournamentScoresHelper

  def get_user_tournament_score(user, tournament)

    score = UserTournamentScore.find_by(:user => user,
                                        :tournament => tournament).score
  end

end