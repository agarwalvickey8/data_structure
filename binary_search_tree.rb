class Tree
  attr_accessor :value, :left, :right
#bla and llala
  def initialize(value) 
    @value = value
    @left = nil
    @right = nil
  end
end

class BST
  attr_accessor :root

  def initialize()
    @root=nil
  end
end

def insert(value)
   if @root == nil
     @root = Tree.new(value) 
   else 
     current_node = @root 
     previous_node = @root 
     while current_node != nil 
       previous_node = current_node 
       if value < current_node.value
         current_node = current_node.left
       else 
         current_node = current_node.right
       end
     end
     if value < previous_node.value
       previous_node.left = Tree.new(value)
     else 
       previous_node.right = Tree.new(value)
     end
   end
end

def largest_element(node=self.root)
  if node == nil
    return nil
  else if node.right == nil
    return node.value
  else
    return largest_element(node.right)
  end
end

def smallest_element(node=self.root)
  if node == nil
    return nil
  else if node.left == nil
    return node.value
  else
    return smallest_element(root.left)
  end
end

def in_order(node = self.root)
  if node == nil
    return
  end
  in_order(node.left)
  print(node.value)
  print(" ")
  in_order(node.right)
end

def pre_order(node=self.root)
  if node == nil
    return 
  end
    print(node.value)
    print(" ")
    pre_order(node.left)
    pre_order(node.right)
end

def post_order(node=self.root)
  if root == nil
    return
  end
  post_order(node.left)
  post_order(node.right)
  print(node.value)
  print(" ")
end

def in_order(node=self.root)
  if node == nil
    return
  in_order(node.left)
  print(node.value)
  print(" ")
  in_order(node.right)
  end
end  
  
def search_element(node = self.root,element)
  if node == nil
    return false
  end
  if node.value == element
    return true
  else if node.value > element
    search_element(node.left, element)
  else
    search_element(node.right, element)
  end
end

def remove_element(value,node = self.root)
  if node == nil
    return nil
  end
  if node.value > value
    node.left = remove_element(value, node.left)
  elsif node.value < value
    node.right = remove_element(value, node.right)
  else
    if node.left != nil && node.right != nil
      temp = node
      min_of_right_subtree = find_min(node.right)
      node.value = min_of_right_subtree.value
      node.right = remove_element(min_of_right_subtree.value, node.right)
    elsif node.left != nil
      node = node.left
    elsif node.right != nil
      node = node.right
    else
      node = nil
    end
  end
  return node
end

def all_paths(node = self.root)
end
puts "Enter number which operation you want to perform: "
puts "1.Add elements in BST"
puts "2.Print largest element"
puts "3.Print smallest element"
puts "4.Print inorder of BST"
puts "5.Print postorder of BST"
puts "6.Print levelorder of BST"
puts "7.Print preorder of BST"
puts "8.Check whether element is present or not"
puts "9.Remove an element from BST"
puts "10.Print all the paths i.e starting from the root to the leaf"
puts "11.Quit"
root = BST.new()
loop_end = false
while(loop_end)
  operation_num=gets.chomp()
  operation_num.to_i
  case operation_num
  when 1
    elements=[]
    print("How much values you want to add in BST:")
    num_values=gets.chomp()
    for i in 1..num_values
      value=gets()
      print(", ")
      insert(value)
    end
  when 2
    puts(largest_element(root))
  when 3
    puts(smallest_element(root))
  when 4
    in_order(root)
  when 5
    post_order(root)
  when 6
    level_order(root)
  when 7
    pre_order(root)
  when 8
    print("Enter element which you want to search:")
    element=gets.chomp()
    print(search_element(root,element))
  when 9
    print("Enter element which you want to remove:")
    element=gets.chomp()
    print(remove_element(root,element))
  when 10
    print(all_paths(root))
  when 11
    print("exit")
    loop_end = true
  else 
    "Default value"
  end
end
