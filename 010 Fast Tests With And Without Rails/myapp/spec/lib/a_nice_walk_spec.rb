require 'a_nice_walk'

describe ANiceWalk do
  context 'without a pet' do
    it 'is impossible' do
      alice = double("alice")
      allow(alice).to receive(:pets) { [] }
      expect do
        ANiceWalk.for(alice)
      end.to raise_error CantWalkWithoutPets
    end
  end

  context 'with a pet' do
    it 'makes the walker happy' do
      alice = double("alice")
      allow(alice).to receive(:pets) { ["fluffy"] }
      alice.should_receive(:update_attributes).with(:happiness => 20)
      ANiceWalk.for(alice)
    end
  end
end
