require 'byebug'
class MyQueue

  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store[0]
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end

end

class MyStack

  def initialize (arr = [])
    @store = arr
  end

  def push(el)
    @store.push(el)
  end

  def pop
    @store.pop
  end

  def peek
    @store[-1]
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end

end

class StackQueue

  def initialize(arr)
    @store1 = MyStack.new(arr)
    @store2 = MyStack.new
    # @window_size =
  end

  def slide_window(el)
    # debugger
    @store2.push(el)
    @store2.push(@store1.pop.keys[0]) until @store1.size == 1
    @store1.pop
    @store1.push(@store2.pop.keys[0]) until @store2.empty?
  end

  def show
    p @store1
    p @store2
  end

  # def min
  #   @store1[-1].values[0][0]
  # end
  #
  # def max
  #   @store1[-1].values[0][1]
  # end



end

# slinky = StackQueue.new([1,2,3,4,5])
# slinky.slide_window(6)
# slinky.show

class MinMaxStack < MyStack

  # def initialize
  #   @store = []
  # end

  def push(el)
    if @store.empty?
      return @store.push({el => [el,el]})
    end
    # debugger
    temp_max = el > @store[-1].values[0][1] ? el : @store[-1].values[0][1]
    temp_min = el < @store[-1].values[0][0] ? el : @store[-1].values[0][0]
    @store.push({el => [temp_min, temp_max]})
  end

  # def size
  #   @store.size
  # end
  #
  def show
    p @store
  end

  def max
    @store[-1].values[0][1]
  end

  def min
    @store[-1].values[0][0]
  end

end

# arr = MinMaxStack.new
# arr.push(1)
# arr.push(5)
# arr.push(-3)
# arr.push(2)
# p arr.max
# p arr.min
# arr.show

class MinMaxStackQueue < StackQueue

  def initialize(array)
    @store1 = MinMaxStack.new
    @store2 = MinMaxStack.new
    array.each do |el|
      @store1.push(el)
    end
  end

  def max
    @store1.max
  end

  def min
    @store1.min
  end

end

# arr = MinMaxStackQueue.new([2,-1,7,8,4,9,100,2])
# arr.slide_window(1)
# arr.slide_window(5)
# arr.slide_window(-3)
# arr.slide_window(2)
# p arr.max
# p arr.min
# arr.show

def windowed_max_range(array, window)
  arr = MinMaxStackQueue.new(array[0...window])
  res = arr.max - arr.min
  array[window..-1].each do |el|
    arr.slide_window(el)
    temp_dif = arr.max - arr.min
    res = temp_dif if temp_dif > res
  end

  res
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2)  # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
