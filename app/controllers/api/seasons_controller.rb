class Api::SeasonsController < Api::BaseController
  def index
    @seasons = seasons
    render json: @seasons, include: { series: :series_tracks }
  end

  def show
    @season = seasons.find(params[:id])
    render json: @season, include: { series: :series_tracks }
  end

  protected

  def seasons
    Season.includes(series: :series_tracks)
  end
end
