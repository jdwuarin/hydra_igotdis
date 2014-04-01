class MatchController < ApplicationController
  def index
    @matches_info = 
    if params && params[:page] 
      Match.get_index_infos(params[:page])
    else
      Match.get_index_infos()
    end
  end
end