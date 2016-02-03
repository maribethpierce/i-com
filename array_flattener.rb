class IntercomArray
  attr_reader :flattened_array

  def initialize(array)
    @array = array
  end

  def flattened
    @flattened_array = []
    @flattened_array << @array.flatten
    @flattened_array.flatten
  end

  def length
    @array.length
  end

end
# array = [[1,2,[3]],4, 1,2,4,[2,3,4,[4,5,[12345]], "soup", "tots"], "fish", [], "tigers"]
# print IntercomArray.new(array).flattened
