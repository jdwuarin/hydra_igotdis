class TypesMatch < ActiveModel::Validator
  def validate(record)
    unless record.contestant.class == record.oponent.class
      record.errors[:type] << 'Contestant and oponent must be of same type'
    end
  end
end

class ContestantDifferentFromOponent < ActiveModel::Validator
  def validate(record)
    if record.contestant.id == record.oponent.id
      record.errors[:id] << 'Contestant and oponent cannot be the same'
    end
  end
end


class MatchResult < ActiveRecord::Base

  belongs_to :match
  belongs_to :contestant, polymorphic: true
  has_one :tournament, through: :match
  belongs_to :oponent, polymorphic: true #should be of the same class as the contestant

  validates :match_id, presence: true
  validates :contestant_id, presence: true
  validates :oponent_id, presence: true
  # validates_presence_of :match
  validates_presence_of :contestant
  validates_presence_of :oponent

  validates_with TypesMatch
  validates_with ContestantDifferentFromOponent

  after_save :check_related_match_result


  def check_related_match_result
    match = self.match
    # find the corresponding match_result if it exists
    related_match_result = MatchResult.find_or_create_by(
      match_id: match.id, 
      contestant_id: self.oponent_id,
      contestant_type: self.oponent_type,
      oponent_id: self.contestant_id,
      oponent_type: self.contestant_type)

    if self.winner != nil
      related_match_result.update_columns(
        winner: !self.winner) # related winner boolean should be opposite
    end
  end

end