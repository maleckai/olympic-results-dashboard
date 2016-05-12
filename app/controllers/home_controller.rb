class HomeController < ApplicationController

  # GET /
  def index
    render json: index_json
  end

  private

  def index_json
    {
      links: {
        events: events_path,
        sports: sports_path
      }
    }
  end

end
