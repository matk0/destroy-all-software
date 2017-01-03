require 'rails_helper'

RSpec.describe Person, type: :model do
  it "can have pets" do
    alice = Person.create!
    fluffy = Pet.create!
    alice.pets << fluffy
    alice.reload.pets.should == [fluffy]
  end
end
