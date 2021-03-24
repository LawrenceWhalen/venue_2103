class Venue
  attr_reader :name,
              :capacity,
              :patrons

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @patrons = []
  end

  def add_patron(patron_name)
    @patrons.push(patron_name)
  end

  def yell_at_patrons
    @patrons.map { |patron| patron.upcase!  }
  end

  def over_capacity
    @patrons.count > @capacity
  end

  def kick_out
    @patrons.shift(@patrons.count - @capacity)
  end
end
