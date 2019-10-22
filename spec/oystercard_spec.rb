require 'oystercard'

describe Oystercard do
  subject { Oysercard.new }
  it "Can create an instance of Oystercard" do
    expect(subject).to be_instance_of(Oystercard)
  end
end