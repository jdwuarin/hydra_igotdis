class MatchesController < ApplicationController
  before_action :store_location, only: [:index]

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
        params[:group] = 1
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

  private



end