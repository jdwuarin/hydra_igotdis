class MatchesController < ApplicationController
  before_action :store_location, only: [:index]
  # to add user stuff. Add if signed_in. 
  # if user is signed_in, send all predictions.
  # if prediction on a match is done look if match over or not
  # if over, show if right or wrong. If not, say points will be assigned soon.
  # If prediction is not done on "dead match", show match as such.

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

  private

    def store_location
      user_session[:return_to] = request.url if request.get?
    end

end