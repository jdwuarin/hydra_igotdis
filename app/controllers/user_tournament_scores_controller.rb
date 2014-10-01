class UserTournamentScoresController < ApplicationController

  def index

    if !params[:tournament_id]
      redirect_to root_path
    elsif params[:tournament_id] == "latest"
      params[:tournament_id] = Tournament.order('start_date desc').first.id
      redirect_to ladder_path(params)
    end

    @user_tournament_scores = UserTournamentScore.where(
      tournament: params[:tournament_id]).joins(:user).where.not(
      users: { username: nil }).paginate(page: params[:page], :per_page => 20)

  end

end