module FixtureLoader
  def load_fixture(name)
    File.open(Rails.root.join('spec', 'fixtures', name)) { |f| f.read }
  end
end
