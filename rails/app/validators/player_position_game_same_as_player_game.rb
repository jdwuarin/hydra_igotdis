class PlayerPositionGameSameAsPlayerGame < ActiveModel::Validator
  def validate(player)

    return unless player.errors.blank?

    if player.game_id != player.player_position.game_id
      player.errors[:type] << "player position game has to be same as player's"
    end

  end
end