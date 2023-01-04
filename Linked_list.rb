class Node
  attr_accessor :next
  attr_reader   :value

  def initialize(value)
    @value = value
    @next  = nil
  end
end

class LinkedList

  def initialize
    @head = nil
  end
end

def add_data(value)
  node = self.head
  if node.nil
    find_tail.next = Node.new(value)
  else
    node = Node.new(value)
  end
end

def find_tail
  node = self.head
  while !node.nil
    return node if node.nil
    node = node.next
  end    
end

def check_value(value)
  node = self.head
  while node != nil
    return true if node.value == value
  end
  false
end

def delete(head, value)
  node = self.head
  return if node.nil
  while !node.nil && node.next.value == value
	  node = node.next
  if node.next.value == value
    node.next = node.next.next

def print_element
  node = self.head
  puts node
  while node = node.next
    puts "#{node}"
  end
end

def reverse(head)
  node = self.head
  return nil if node.nil
  prev = nil
  curr = node
  while(curr)
    temp = curr.next
    curr.next = prev
    prev = curr
    curr = temp
  end
  node.next = prev
  node
end

puts "Enter number which operation you want to perform: "
puts "1.Check whether element is present or not"
puts "2.Add elements in linked list"
puts "3.Remove an element from linked list"
puts "4.Reverse linked list"
puts "5.Print linked list"
puts "5.Quit"

head = LinkedList.new()
loop_end = false
while(!loop_end)
  operation_num = gets.chomp()
  operation_num.to_i
  case operation_num
  when 1
    check_value(head)
  when 2
    elements = []
    print("How much values you want to add in linked list:")
    num_values = gets.chomp()
    for i in 1..num_values.to_i
      value = gets()
      print(", ")
      add_data(value)
    end
  when 3
    print("Enter value which you want to delete:")
    element = gets.chomp()
    delete(head, value)
  when 4
    reverse(head)
  when 5
    print_element(head)
  when 6
    print("exit")
    loop_end = true
  end
end

