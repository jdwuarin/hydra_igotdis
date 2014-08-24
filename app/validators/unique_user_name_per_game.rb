class UniqueUserNamePerGame < ActiveModel::Validator
  def validate(record)
    if !Player.where(user_name: record.user_name, game_id: record.game_id).empty?
      player.errors[:user_name] << 'User with the name' +
                                    record.user_name + 
                                    'already exists for game ' + 
                                    record.game_id
    end
  end
end

class UniqueTeamNamePerGame < ActiveModel::Validator
  def validate(record)
    if !Team.where(name: record.name, game_id: record.game_id).empty?
      player.errors[:name] << 'Team with the name' +
                              record.name + 
                              'already exists for game ' + 
                              record.game_id
    end
  end
end