class EventsController < ApplicationController

  # GET /events
  def index
    render json: index_json
  end

  private

  def index_json
    {
      links: {
        up: root_path,
        self: events_path,
        in_progress: events_in_progress_path,
        upcoming: events_upcoming_path
      }
    }
  end

end
