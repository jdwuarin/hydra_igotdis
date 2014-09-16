class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :continent_id,
             :tournament_type, :has_groups, :group_count
end