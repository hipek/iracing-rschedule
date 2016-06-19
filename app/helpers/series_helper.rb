module SeriesHelper
  def active_week(series_track)
    track_date = series_track.date
    if track_date < Date.today && track_date + 7 > Date.today
      'active'
    end
  end
end
