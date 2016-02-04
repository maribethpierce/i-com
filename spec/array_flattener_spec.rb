require 'spec_helper'
require_relative '../array_flattener.rb'

test_array = [[1,2,[3]],4, 1,2,4,[2,3,4,[4,5,[12345]], "soup", "tots"], "fish", [], "tigers"]

RSpec.describe "flattener" do

  it "should take a nested array and return a flat array with all elements" do

    array = IntercomArray.new(test_array)
    empty_array = IntercomArray.new([])
    expect(array.length).to eq(9)
    expect(array.flattened.length).to eq(17)
    expect(array.flattened.each { |x| x.class } ).to_not eq(Array)
    expect(empty_array.flattened.length).to eq(0)
  end
end
