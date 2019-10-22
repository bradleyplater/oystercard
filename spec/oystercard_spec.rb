require 'oystercard'

describe Oystercard do
  subject { Oystercard.new }
  let (:station) {double :station}

  before(:each) do
    subject.top_up(Oystercard::LIMIT)
  end

  it "Can create an instance of Oystercard" do
    expect(subject).to be_instance_of(Oystercard)
  end

  it "Balance is 0 when initialized" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end

  it "Balance is able to be topped up" do
    expect(subject.balance).to eq 90
  end

  it "Raises an error when top up is over the limit" do
    expect { subject.top_up(200) }.to raise_error ('The limit is £90')
  end

  it "Should initially not be in journey" do
    expect(subject).not_to be_in_journey
  end

  it "Should be set to in use when user touches in" do
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  it "should be set to not in use when user touches out" do
    subject.touch_in(station)
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it "Should raise error if user does not have enough funds for one journey" do
    oystercard = Oystercard.new
    expect{ oystercard.touch_in(station) }.to raise_error "Not enough funds"
  end

  it "Should deduct the correct amount from the balance" do
    subject.touch_in(station)
    expect{ subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
  end

  it "Should be able to store the entry station" do
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end
end
