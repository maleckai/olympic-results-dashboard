class EventSerializer < ActiveModel::Serializer
  has_one :sport
  has_many :event_teams
  attributes :start_at, :finish_at
end
