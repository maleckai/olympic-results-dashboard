class EventTeamSerializer < ActiveModel::Serializer
  has_one :country
  attributes :score
end
