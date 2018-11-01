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
    @store2.push(el)
    @store2.push(@store1.pop) until @store1.size == 1
    @store1.pop
    @store1.push(@store2.pop) until @store2.empty?
  end

  def show
    p @store1
    p @store2
  end


end

slinky = StackQueue.new([1,2,3,4,5])
slinky.slide_window(6)
slinky.show

class MinMaxStack < MyStack
  def initialize(arr = [])
    @store = MyStack.new(arr)
    @min = arr.empty? ? 999 : arr.min
    @max = arr.empty? ? -999 : arr.max

  end

  def push(el)

  end


end
