require 'coffee-script'
require './string.coffee'

season = require './season_builder'
data = require('fs').readFileSync process.argv[2], 'utf8'

builder = new season.SeasonBuilder null, data
console.log JSON.stringify builder.build()
