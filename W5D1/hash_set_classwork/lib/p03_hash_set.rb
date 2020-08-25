class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == num_buckets
      resize!
    end
    hashed = key.hash
    if !include?(key)
      @store[hashed % num_buckets] << key
      @count += 1
    end
  end
    
  def include?(key)
    hashed = key.hash
    @store[hashed % num_buckets].include?(key)
  end
    
  def remove(key)
    hashed = key.hash
      
    if include?(key)
      @store[hashed % num_buckets].delete(key)
      @count -= 1
    end
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
        temp_store[num.hash % temp_store.length] << num
      end
    end

    @store = temp_store
  end
end
