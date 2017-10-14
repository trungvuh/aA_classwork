class Node
  attr_accessor :key, :val, :next, :prev

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
  def initialize
    @head = Node.new("head", nil)
    @tail = Node.new("tail", nil)
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
    first == @tail
  end

  def get(key)

  end

  def include?(key)

  end

  def append(key, val)
    new_last_node = Node.new(key, val)
    old_last_node = @tail.prev
    old_last_node.next = new_last_node
    new_last_node.prev = old_last_node
    new_last_node.next = @tail
    @tail.prev = new_last_node
  end

  def update(key, val)
    self.each do |
  end

  def remove(key)

  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
