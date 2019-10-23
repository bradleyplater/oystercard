require 'journey' 

describe Journey do

  subject { Journey.new }

  it 'subject can be an instance of Journey' do
    expect(subject).to be_instance_of Journey
  end
end
