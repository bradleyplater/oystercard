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
    expect { subject.top_up(200) }.to raise_error ('The limit is £90')
  end

  it "Balance is able to be deducted" do
    subject.top_up(10)
    subject.deduct(5)
    expect(subject.balance).to eq 5
  end

  it "Does not allow balance to go below 0" do
    subject.top_up(5)
    expect { subject.deduct(10) }.to raise_error 'Not enough funds'
  end

  it "Should initially not be in journey" do
    expect(subject).not_to be_in_journey
  end

  it "Should be set to in use when user touches in" do
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it "should be set to not in use when user touches out" do
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end
end
