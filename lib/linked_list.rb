# linked_list.rb
require_relative "node"

class LinkedList 
  attr_accessor :head

  def initialize()
    @head = nil
  end

  def append(data)
    empty? ? set_head(data) : set_tail(data)
  end

  def prepend(data)
    node = new_node(data)
    node.next_node = @head
    self.head = node
  end

  def size
    return 0 if empty?
    count_node(@head, 1)
  end

  def count 
    return size()
  end

  def length
    return size()
  end

  def head
    @head
  end

  def tail
  end

  def at
  end

  def pop
  end

  def include?
  end

  def find
  end

  def to_s
  end

  def insert_at
  end

  def remove_at
  end

  private
  def count_node(node, counter)
    return counter if node.tail?
    count_node(node.next_node, counter += 1)
  end

  def last_node(node)
    return node if node.tail?
    last_node(node.next_node)
  end

  def new_node(data)
    Node.new(data)
  end

  def set_head(data)
    self.head = new_node(data)
  end
  
  def set_tail(data)
    last_node(@head).next_node = new_node(data)
  end

  def empty?
    return @head == nil
  end

  def stringify
  end

  def concat
  end

end
