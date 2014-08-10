class Match < ActiveRecord::Base

  has_many :real_bets
  has_many :play_bets
  belongs_to :tournament

  validates :tournament_id, presence: true
  validates_presence_of :tournament

  after_save :settle_predictions_if_over

  # make sure all match results are destroyed when a match is destroyed
  # before_destroy { |match| MatchResult.destroy_all "match_id = #{match.id}" }


  def to_s()
    "Match Id: " + self.id.to_s + ", Date: " + date.to_s
  end

  def settle_predictions_if_over
    if self.finished == true
      # all sorts of magic must happen
    end
  end

  # def self.get_index_infos(page=1)
  #   matches_info = []
  #   lower_bound = (page-1)*20
  #   upper_bound = (20*page)-1

  #   matches = Match.where(
  #     finished: false).order(:date)[lower_bound..upper_bound]
  #   matches.each do |match|
  #     match_info = {}
  #     match_results = match.match_results
  #     if match_results.length == 0
  #       next
  #     end

  #     match_info[:tournament] = match.tournament.name
  #     match_info[:contestants_type] = match_results[0].contestant_type
  #     if match_info[:contestants_type] == "Player"
  #       match_info[:contestant1] = match_results[0].contestant.user_name
  #       match_info[:contestant2] = match_results[0].oponent.user_name
  #     else
  #       match_info[:contestant1] = match_results[0].contestant.name
  #       match_info[:contestant2] = match_results[0].oponent.name
  #     end
  #     matches_info.push(match_info)
  #   end
  #   matches_info
  # end
end
