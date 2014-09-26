
# please note, any reference to receiving_contestant
# or invited_contestant is made fore their respective results
# in the match object

class MatchResultsValidator < ActiveModel::Validator
  def validate(match)
    # if other errors, return
    return unless match.errors.blank?

    if match.finished
      tournament_type = match.round.tournament.tournament_type

      if tournament_type == TournamentTypes::LOL_WORLD_CUP
       validate_lwc_results(match)
      end

    end
  end

  def validate_lwc_results(match)

    results = match.results

    validate_common_lwc_results(match, results)

    if match.round.round_type == RoundTypes::GROUP_STAGE

      return

    elsif match.round.round_type == RoundTypes::QUARTER_FINALS

      # check score
      validate_lwc_score_results(match, results,
        ResultsFormat::LWC_MAX_QUARTER_FINAL_SCORE)

    else

      validate_lwc_score_results(match, results,
        ResultsFormat::LWC_MAX_OTHER_SCORE)
      # check most first blood
      validate_lwc_standard_key_result(match, results, "most_first_blood")

      if match.round.round_type == RoundTypes::FINAL
        validate_lwc_standard_key_result(match, results, "most_dragon")
      end

    end

  end

  def validate_common_lwc_results(match, results)

    unless results.length == 3
      match.errors[:results] << "result size must be 3"
      return
    end

    unless results.has_key?("type") &&
      results["type"] == TournamentTypes::LOL_WORLD_CUP
        match.errors[:results] << "result type is wrong or undeclared"
      return
    end

    unless results.has_key?("receiving_contestant") 
        match.errors[:results] << "result receiving_contestant missing"
        return
    end

    unless results.has_key?("invited_contestant") 
        match.errors[:results] << "result receiving_contestant missing"
        return
    end

    validate_lwc_single_contestant(match, results["receiving_contestant"])
    validate_lwc_single_contestant(match, results["invited_contestant"])

    unless results["receiving_contestant"]["winner"] !=
      results["invited_contestant"]["winner"]
      match.errors[:results] << "only one contestant can win or lose"
      return
    end


  end

  def validate_lwc_single_contestant(match, contestant)

    unless contestant.has_key?("winner") 
        match.errors[:results] << "contestant winner key is missing"
        return
    end

    unless contestant["winner"] == true || contestant["winner"] == false
        match.errors[:results] << "contestant winner key must be t or f"
        return
    end

    unless contestant.has_key?("most_dragon") 
        match.errors[:results] << "contestant winner key is missing"
        return
    end

    unless contestant.has_key?("most_first_blood") 
        match.errors[:results] << "contestant winner key is missing"
        return
    end

    unless contestant.has_key?("score") 
        match.errors[:results] << "contestant winner key is missing"
        return
    end

  end

  def validate_lwc_score_results(match, results, max_score)

    score_1 = results["receiving_contestant"]["score"]
    score_2 = results["invited_contestant"]["score"]

    # check score
    cond_1 = score_1 != nil
    cond_2 = score_2 != nil

    unless cond_1 && cond_2
        match.errors[:results] << "score can't be nil"
        return
    end

    cond_3 = score_1 <= max_score
    cond_4 = score_2 <= max_score
    cond_5 = score_1 >= 0
    cond_6 = score_2 >= 0
    cond_7 = score_1 != score_2
    cond_8 = !(score_1 != max_score && score_2 != max_score)

    unless cond_3 && cond_4 && cond_5 && cond_6 && cond_7 && cond_8
        match.errors[:results] << "score is invalid"
        return
    end

  end

  def validate_lwc_standard_key_result(match, results, key_result)

    # mfb stands for most_first_blood
    result_1 = results["receiving_contestant"][key_result]
    result_2 = results["invited_contestant"][key_result]

    # check most first blood
    cond_1 = result_1 != nil
    cond_2 = result_2 != nil

    unless cond_1 && cond_2
        match.errors[:results] << key_result + " can't be nil"
        return
    end

    cond_3 = result_1 != result_2
    cond_4 = result_1 == true || result_1 == false
    cond_5 = result_2 == true || result_2 == false

    unless cond_3 && cond_4 && cond_5 
        match.errors[:results] << key_result + " score is invalid"
        return
    end

  end

end


