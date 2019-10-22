require 'oystercard'

describe Oystercard do
  subject { Oystercard.new }
  it "Can create an instance of Oystercard" do
    expect(subject).to be_instance_of(Oystercard)
  end
end