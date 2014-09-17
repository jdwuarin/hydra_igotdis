class Api::V1::TournamentsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @tournaments = Tournament.all

    respond_to do |format|
      format.html { render html: @tournaments }
      format.json { render json: @tournaments }
    end
  end

end