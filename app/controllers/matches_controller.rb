class MatchesController < ApplicationController
  before_action :store_location, only: [:index]
  # to add user stuff. Add if signed_in. 
  # if user is signed_in, send all predictions.
  # if prediction on a match is done look if match over or not
  # if over, show if right or wrong. If not, say points will be assigned soon.
  # If prediction is not done on "dead match", show match as such.

  def index
    tournament = Tournament.find(params[:tournament_id])
    rounds = tournament.rounds
    round = Round.find(params[:round_id])
    @context = { :tournament => tournament,
                 :rounds => rounds,
                 :round => round}
    if params[:group]
      @context[:group] = params[:group]
      matches = []
      _matches = round.matches

      _matches.each do |match|
        if match.receiving_contestant.group_id == params[:group].to_i
          matches.append(match)
        end
      end
    else
      if !round.is_direct_elimination_round
        params[:group] = 3
        redirect_to url_for params
      else
        matches = round.matches
      end
    end
    @context[:matches] = matches

    if params[:user]
      user = User.find(username: params[:user])
      @context[:predictions] = UserMatchPrediction.where(
        user: user, match: matches)

    elsif current_user
      @context[:predictions] = UserMatchPrediction.where(
        user: current_user, match: matches)
    end

  end

end