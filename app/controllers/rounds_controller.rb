class RoundsController < ApplicationController

  def index
    tournament = Tournament.find(params[:tournament_id])
    @rounds = tournament.rounds
    # this should never happen, but for the hell
    # of it, here is the code taking care of that
    if !@rounds
      redirect_to root_path
    end
  end

end