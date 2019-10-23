require 'station'

describe Station do
  subject { Station.new("Station1",1) }

  it 'checks that subject is an instance of station' do
    expect(subject).to be_instance_of Station
  end

  it 'station is able to store a name' do
    expect(subject.name).to eq "Station1"
  end
end