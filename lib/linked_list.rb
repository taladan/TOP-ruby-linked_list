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
    return last_node(@head)
  end

  def at(position, node=@head, counter=0)
    return node if counter == position
    at(position, node.next_node, counter += 1)
  end

  def pop
    if @head.next_node.nil?
      node = @head
      @head = nil
      return node
    end
    new_tail = at(count-2, @head)
    old_tail = new_tail.next_node
    new_tail.clear!
    return old_tail
  end

  def include?(data)
    has_data(data, node=@head)
  end

  def find(value, node=@head, count=0)
    return count if value == node.data
    return nil if node.tail?
    node = node.next_node
    find(value, node, count += 1)
  end

  def to_s(start=0, terminal=nil)
    return nil if empty?
    node = at(start)
    stringify_node(node.next_node, sentence_starter(node.data), start, terminal, start+1)
  end

  def insert_at(data, position)
    node = new_node(data)
    old_node = at(position)
    previous_node = at(position-1)
    node.next_node = old_node
    previous_node.next_node = node
    node
  end

  def remove_at(position)
    node = at(position)
    previous_node = at(position - 1)
    previous_node.next_node = node.next_node
    node.clear!
    node
  end

  private

  def stringify_node(node, sentence, start,  terminal, counter=1)
    return concat(sentence, node, terminal) if node.tail? || terminal == counter - start + 1
    # This is a bit hackey.  Sending nil to concat so that it won't mis-build the list.
    stringify_node(node.next_node,concat(sentence,node, nil), start, terminal, counter +=1) 
  end
  
  def sentence_starter(data)
    "( #{data} ) -> "
  end

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

  def concat(sentence, node, terminal)
    return sentence + "( #{node.data} ) -> nil" if node.tail?
    return sentence + "( #{node.data} )" if !terminal.nil?
    return sentence + "( #{node.data} ) ->"
  end
  
  def has_data(value, node=@head)
    return true if node.data == value
    return false if node.tail?
    has_data(value, node.next_node)
  end

end
