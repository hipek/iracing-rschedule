class UserSeasonsController < ApplicationController
  before_action :set_user_season, only: [:show, :edit, :update, :destroy]

  def index
    @user_seasons = current_team.user_seasons.includes(:user, :season).order('seasons.name desc').all
  end

  def new
    @user_season = UserSeason.new
  end

  def edit
  end

  def create
    @user_season = UserSeason.new(user_season_params)

    respond_to do |format|
      if @user_season.save
        format.html { redirect_to user_seasons_url, notice: 'Data was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_season.update(user_season_params)
        format.html { redirect_to user_seasons_url, notice: 'Data was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user_season.destroy
    respond_to do |format|
      format.html { redirect_to user_seasons_url }
    end
  end

  protected

    def set_user_season
      @user_season = UserSeason.find(params[:id])
    end

    def user_season_params
      params.require(:user_season).permit(:user_id, :season_id, series_names: []).tap do |param|
        param[:series_names].reject!(&:blank?)
      end
    end
end
