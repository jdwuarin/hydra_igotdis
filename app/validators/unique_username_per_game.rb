class UniqueUsernamePerGame < ActiveModel::Validator
  def validate(record)
    if !record.class.where(username: record.username, 
                           game_id: record.game_id).empty?
      record.errors[:username] << 'Player with the name' +
                                   record.username + 
                                   'already exists for game ' + 
                                   record.game_id
    end
  end
end