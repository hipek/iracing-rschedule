SeasonParser = require('./season_parser').SeasonParser
_ = require 'underscore'

class @SeasonBuilder
  @BLACKLISTED_WORDS = [
    'Full', 'Circuit', 'Speedway', 'Park',
    'Raceway', 'Course', 'Racing', '(Night) Dynamic weather',
    '(Night) Qual attached', '(Night)', 'Night', 'Dynamic weather',
    'Qual attached', '(Afternoon)', '(Late Afternoon)', '(Morning)'
  ]

  constructor: (@name, @data) ->
    @parser = new SeasonParser @data

  build: ->
    season = {}
    seriesList = []

    @parser.series().forEach (series) =>
      season.name ||= @name || series.seasonName
      ss = _.pick series, 'name', 'raceType', 'license', 'seasonName', 'cars'
      ss.tracks = []

      _.each series.tracks, (track, i) =>
        ss.tracks.push @buildTrack track, i

      ss.activeFrom = @seriesActiveFrom ss
      ss.activeTo   = @seriesActiveTo ss

      seriesList.push ss

    seriesList

    #     activeFrom: doc.seriesActiveFrom()
    #     activeTo: doc.seriesActiveTo()

  seriesActiveFrom: (ss) ->
    ss.tracks[0].date

  seriesActiveTo: (ss) ->
    tracks = ss.tracks
    endDate = new Date tracks[tracks.length - 1].date.getTime()
    endDate.setDate endDate.getDate() + 7
    endDate

  buildTrack: (data, i) ->
    track =
      week: i + 1
      date: new Date Date.parse data[0]
      name: data[1]
      duration: data[2]
      timeOfDay: data[3]
      key: @trackKeyName(data[1])[1]
      shortName: @trackKeyName(data[1])[0]

  trackKeyName: (name) ->
    legacyYear = (name.match(/(20[0-9]{2})/) || [])[0]
    name = name.split(' - ')[0]
    name = [name, legacyYear].join(' ') if legacyYear && !name.contains(legacyYear)
    tname = _.clone name
    @constructor.BLACKLISTED_WORDS.forEach (word) ->
      tname = tname.replace word, ' '
    key = tname.replace(/\s+/g, ' ').trim().toLowerCase()
    [name, key]

SeasonBuilder = @SeasonBuilder
