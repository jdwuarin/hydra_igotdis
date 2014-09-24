class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all
    redirect_to root_path
  end

  def latest
    redirect_to tournament_rounds_path(
      Tournament.order('start_date desc').first)
  end

end