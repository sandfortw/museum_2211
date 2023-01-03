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

  def patrons_by_exhibit_interest
    hash = {}
    @exhibits.each do |exhibit|
      hash[exhibit] = []
    end
    
    @patrons.each do |patron|
      recommend_exhibits(patron).each do |recommended|
        hash[recommended] << patron
      end
    end
    hash
   end

  
  
  
end