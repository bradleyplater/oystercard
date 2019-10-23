require 'station'

describe Station do
  subject { Station.new }

  it 'checks that subject is an instance of station' do
    expect(subject).to be_instance_of Station
  end
end