class SportEventsController < ApplicationController

  # GET /sports/:sport_id/events
  def index
    render json: all_events_for_sport, meta_key: :links, links: index_links
  end

  private

  def index_links
    {
      up: sport_path(sport_id),
      self: sport_events_path(sport_id)
    }
  end

  def all_events_for_sport
    Event.for_sport(sport_id)
  end

  def sport_id
    @sport_id ||= params[:sport_id]
  end

end
