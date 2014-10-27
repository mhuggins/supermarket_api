RSpec::Matchers.define :be_an_array_of do |expected|
  match do |actual|
    expect(actual).to be_an(Array).and(all(be_an(expected)))
  end
end
