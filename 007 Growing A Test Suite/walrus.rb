class Walrus
  def receive_gift! gift
    if gift.edible?
      gift.digest!
    end
  end
end

describe Walrus do
  it "eats food" do
    cheese = double("cheese")
    allow(cheese).to receive(:edible?) {true}
    cheese.should_receive(:digest!)
    subject.receive_gift!(cheese)
  end

  it "ignores non-edible things" do
    shoes = double("shoes")
    allow(shoes).to receive(:edible?) {false}
    subject.receive_gift!(shoes)
  end
end
