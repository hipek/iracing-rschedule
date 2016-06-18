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

    it { expect(season.series.size).to eql 41 }
    it { expect(season.save).to eq true }
  end
end
