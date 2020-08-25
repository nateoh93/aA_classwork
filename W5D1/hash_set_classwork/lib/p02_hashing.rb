class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    # first = self[0]
    # (1...self.length).each do |i|
    #   first = first ^ self[i]
    # end
    # first
    first = ""
    self.each {|ele| first += ele.to_s }
    first.to_i.hash
  end
end

class String
  def hash
    first = ""
    self.each_char {|ele| first += ele.ord.to_s }
    first.to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    first = ""
    (self.values.sort + self.keys.sort).each do |ele|
      first += ele.to_s.ord.to_s
    end

    first.to_i.hash
  end
end
