class Events::UpcomingEventsController < ApplicationController

  # GET /events/upcoming
  def index
    render json: upcoming_events, meta_key: :links, links: index_links
  end

  private

  def index_links
    {
      up: events_path,
      self: events_upcoming_path
    }
  end

  def upcoming_events
    Event.upcoming
  end

end
