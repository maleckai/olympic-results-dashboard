class SportSerializer < ActiveModel::Serializer
  attributes :name, :links

  def links
    {
      up: sports_path,
      self: sport_path(object.id),
      events: sport_events_path(object.id)
    }
  end
end
