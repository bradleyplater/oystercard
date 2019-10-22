require 'oystercard'

describe Oystercard do
  subject { Oystercard.new }
  it "Can create an instance of Oystercard" do
    expect(subject).to be_instance_of(Oystercard)
  end

  it "Balance is 0 when initialized" do
    expect(subject.balance).to eq 0
  end

  it "Balance is able to be topped up" do
    subject.top_up(5)
    expect(subject.balance).to eq 5
  end

  it "Raises an error when top up is over the limit" do
    expect(subject.top_up(100)).to raise_error "The limit is £90"
  end
end