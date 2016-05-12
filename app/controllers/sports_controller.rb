class SportsController < ApplicationController

  # GET /sports
  def index
    render json: all_sports, meta_key: :links, links: index_links
  end

  # GET /sports/:id
  def show
    render json: found_sport, root: false
  end

  private

  def index_links
    {
      up: root_path,
      self: sports_path
    }
  end

  def all_sports
    Sport.all
  end

  def found_sport
    Sport.find(params[:id])
  end

end
