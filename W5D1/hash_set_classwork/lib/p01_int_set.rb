class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num > @store.length - 1
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !include?(num)
      @store[num % num_buckets] << num
    end
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count == num_buckets
      resize!
    end
    
    if !include?(num)
      @store[num % num_buckets] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = Array.new(@count * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |num|
        temp_store[num % temp_store.length] << num
      end
    end

    @store = temp_store
  end
end
