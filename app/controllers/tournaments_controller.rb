class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all
  end

  def show
    begin
      @tournament = Tournament.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
    end
  end

end