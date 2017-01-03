class ANiceWalk
  def self.for(person)
    raise CantWalkWithoutPets if person.pets.empty?
    person.update_attributes(:happiness => 20)
  end
end

class CantWalkWithoutPets < Exception
  
end
