class UniqueUserNamePerGame < ActiveModel::Validator
  def validate(record)
    if !Player.where(username: record.username, game_id: record.game_id).empty?
      player.errors[:username] << 'User with the name' +
                                    record.username + 
                                    'already exists for game ' + 
                                    record.game_id
    end
  end
end