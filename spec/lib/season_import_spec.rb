require 'rails_helper'

RSpec.describe SeasonImport do
  let(:data) { JSON.parse(load_fixture('2016S3.json')) }

  subject { described_class.new data }

  describe '#season' do
    it 'builds season with season name' do
      expect(subject.season.name).to eql '2016 Season 3'
    end
  end

  describe '#run' do
    let(:season) { subject.run }

    it {
      expect(season.series.size).to eql 41
      expect(season.save).to eq true
    }

    describe 'first series' do
      let(:series) { season.series.first }

      it {
        expect(series.name).to eq 'iRacing Advanced Legends'
        expect(series.race_type).to eq 'OVAL'
        expect(series.license).to eq 'R'
        expect(series.series_tracks.size).to eql 12
        expect(series.cars).to eql ['Legends Ford \'34 Coupe']
      }

      describe 'first series track' do
        let(:series_track) { season.series.first.series_tracks.first }
         it {
           expect(series_track.track.name).to eql 'Charlotte Motor Speedway'
           expect(series_track.date).to eq Date.parse('Tue, 14 Jun 2016')
           expect(series_track.week).to eq 1
           expect(series_track.duration).to eq '40 laps'
           expect(series_track.time_of_day).to eq '(Afternoon)'
         }
      end
    end
  end
end
