require 'rspec'
require './lib/venue'

describe Venue do
  describe '#initialize' do
    it 'is a venue' do
      venue = Venue.new('Bluebird', 4)
      expect(venue).to be_a Venue
    end

    it 'can read the name' do
      venue = Venue.new('Bluebird', 4)
      expect(venue.name).to eq 'Bluebird'
    end

    it 'can read the capacity' do
      venue = Venue.new('Bluebird', 4)
      expect(venue.capacity).to eq 4
    end

    it 'has no patrons by default' do
      venue = Venue.new('Bluebird', 4)
      expect(venue.patrons).to eq []
    end
  end

  # Iteration 2

  describe '#add_patron' do
    it 'returns a list of patrons' do
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')

      expect(venue.patrons).to eq ['Mike', 'Megan', 'Bob']
    end
  end

  describe '#yell_at_patrons' do
    it 'returns a list of uppercased names' do
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')
      expect(venue.yell_at_patrons).to eq ['MIKE', 'MEGAN', 'BOB']
    end
  end

  describe '#over_capacity' do
    it 'can tell when not over capacity' do
      venue = Venue.new('RedRocks', 1000)
      500.times do
        venue.add_patron('Mike')
      end

      expect(venue.over_capacity).to eq(false)
    end

    it 'returns can tell when over capacity' do
      venue = Venue.new('RedRocks', 1000)
      1001.times do
        venue.add_patron('Misty')
      end

      expect(venue.over_capacity).to eq(true)
    end
  end

  describe '#kick_out' do
    it 'can kick out patrons until the venue is not over capacity' do
      venue = Venue.new('Samson', 3)
      venue.add_patron('Zack')
      venue.add_patron('Zach')
      venue.add_patron('Zip')
      venue.add_patron('Zane')
      venue.add_patron('Zales')
      venue.add_patron('Tim')

      venue.kick_out

      expect(venue.over_capacity).to eq(false)
    end
  end
end
