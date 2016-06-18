class SeasonImport < Struct.new(:data)
  def run
    season.tap { build_full_season }
  end

  def build_full_season
    data.each do |series|
      season.series << build_series(OpenStruct.new(series))
    end
  end

  def season
    @season ||= Season.new name: season_name
  end

  protected

  def season_name
    data.first['seasonName']
  end

  def build_series(series)
    Series.new(
      name: series.name,
      race_type: series.raceType,
      license: series.license,
      cars: series.cars,
      series_tracks: build_series_tracks(series.tracks)
    )
  end

  def build_series_tracks(stracks)
    stracks.map do |strack|
      st = OpenStruct.new(strack)
      SeriesTrack.new(
        week: st.week,
        date: st.date,
        name: st.name,
        duration: st.duration,
        time_of_day: st.timeOfDay,
        track: build_track(st.keyName, st.shortName)
      )
    end
  end

  def build_track(key, name)
    Track.find_or_create(key, name)
  end
end
