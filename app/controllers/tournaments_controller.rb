class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all
  end

  def show
    begin
      @tournament = Tournament.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @tournament = Tournament.order(:created_at).last
    end
  end

end