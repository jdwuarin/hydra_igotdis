class Api::V1::TournamentsController < ApplicationController
  respond_to :json

  def index
    render json: Tournament.all
    # render json: Tournament.all, serializer: TournamentSerializer
  end

  def show
    render json: tournament
  end

  # def create
  #   respond_with :api, :v1, Tournament.create(tournament_params)
  # end

  # def update
  #   respond_with tournament.update(tournament_params)
  # end

  # def destroy
  #   respond_with tournament.destroy
  # end

  private

    def tournament
      Tournament.find(params[:id])
    end

    def tournament_params
      params.require(:tournament).permit(
        :name, :start_date, :continent_id, :game_id, :description, :tournament_type)
    end

end