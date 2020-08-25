class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current = @head
    while current.key != key && current != @tail
      current = current.next
    end

    if current == @tail
      nil 
    else
      current.val
    end

  end

  def include?(key)
    current = @head
    while current != @tail
      return true if current.key == key
      current = current.next
    end

    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    @tail.prev.next = new_node
    new_node.prev = @tail.prev
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
    current = @head
    while current.key != key && current != @tail
      current = current.next
    end

    current.val = val if current != @tail
  end

  def remove(key)
    current = @head

    while current.key != key && current != @tail
      current = current.next
    end
    
    current.next.prev = current.prev
    current.prev.next = current.next

  end

  def each
    current = @head.next
    while current != @tail
      yield(current)
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
