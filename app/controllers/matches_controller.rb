class MatchesController < ApplicationController

  def index
    tournament = Tournament.find(params[:tournament_id])
    @rounds = tournament.rounds
    @round = Round.find(params[:round_id])
    if params[:group]
      @matches = []
      _matches = @round.matches

      _matches.each do |match|
        if match.receiving_contestant.group_id == params[:group].to_i
          @matches.append(match)
        end
      end
    else
      if !@round.is_direct_elimination_round
        redirect_to tournament_round_matches_path(tournament,
                                                  @round, :group => 1)
      else
        @matches = @round.matches
      end
    end
  end

end