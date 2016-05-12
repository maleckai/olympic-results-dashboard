class Events::InProgressEventsController < ApplicationController

  # GET /events/in_progress
  def index
    render json: in_progress_events, meta_key: :links, links: index_links
  end

  private

  def index_links
    {
      up: events_path,
      self: events_in_progress_path
    }
  end

  def in_progress_events
    Event.in_progress
  end

end
