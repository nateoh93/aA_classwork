require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    hashed = key.hash
    @store[hashed % num_buckets].include?(key)
  end

  def set(key, val)
    hashed = key.hash
    if include?(key)
      @store[hashed % num_buckets].update(key, val)
    else
      if @count == num_buckets
        resize!
      end
      @store[hashed % num_buckets].append(key, val)
      @count += 1
    end
  end

  def get(key)
    hashed = key.hash
    @store[hashed % num_buckets].get(key)
  end

  def delete(key)
    hashed = key.hash
    @store[hashed % num_buckets].remove(key)
    @count -= 1
  end

  def each
    @store.each do |bucket|
      bucket.each do |node|
        yield(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = Array.new(@count * 2) { LinkedList.new}
    @store.each do |bucket|
      bucket.each do |node|
        temp_store[node.key.hash % temp_store.length].append(node.key, node.val)
      end
    end

    @store = temp_store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
