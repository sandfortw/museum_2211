class Museum
  attr_reader :name, 
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      patron.interests.join(" ").include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end
  
end