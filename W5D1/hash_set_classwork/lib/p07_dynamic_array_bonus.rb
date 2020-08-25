require 'byebug'
class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable
  attr_accessor :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    @store[i]
  end

  def []=(i, val)
    @store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    i = 0
    while i < @store.length
      return true if @store[i] == val
      i += 1
    end
    false
  end

  def push(val)
    @store[@count] = val
    @count += 1
  end

  def unshift(val) #works but need to resize
    # debugger
    i = 1
    past = @store[0]
    j = @count
    while i <= j
      temp = @store[i]
      @store[i] = past
      past = temp
      i += 1
    end
    @store[0] = val
  end

  def pop #bad
    return nil if @count == 0
    value = @store[@count - 1]
    @store[@count - 1] = nil
    @count -= 1
    value
  end

  def shift
  end

  def first
    @store[0]
  end
  
  def last
    @store[@count-1]
  end

  def each
    i = 0
    j = @count
    while i < j
      yield(@store[i])
      i += 1
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
  end
end
