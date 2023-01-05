class Tree
	attr_accessor :value, :left, :right

	def initialize(value) 
		@value = value
		@left = nil
		@right = nil
	end
end

class BST
	attr_accessor :root

	def initialize
		@root = nil
	end
end

def insert(value)
	if self.root.nil?
		self.root = Tree.new(value) 
	else 
		current_node = self.root 
		previous_node = self.root 
		while !current_node.nil? 
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
	return nil if node.nil?
	return node.value if node.right.nil?
	return largest_element(node.right)
end

def smallest_element(node=self.root)
	return nil if node.nil?
	return node.value if node.left.nil?
	smallest_element(root.left)
end

def in_order(node = self.root)
	return if node.nil?
	in_order(node.left)
	print"#{node.value}"
	print(" ")
	in_order(node.right)
end

def pre_order(node=self.root)
	return if node.nil?
	print"#{node.value}"
  print(" ")
	pre_order(node.left)
	pre_order(node.right)
end

def post_order(node=self.root)
	return if root.nil?
	post_order(node.left)
	post_order(node.right)
	print"#{node.value}"
	print(" ")
end

def in_order(node=self.root)
	return if node.nil?
	in_order(node.left)
	print"#{node.value}"
	print(" ")
	in_order(node.right)
end  

def search_element(node = self.root,element)
	return false if node.nil?
	return true if element == node.value
	if element < node.value
	end
end
def remove_element(value,node = self.root)
	return nil if node.nil?
	if value < node.value
		node.left = remove_element(value, node.left)
	elsif node.value < value
		node.right = remove_element(value, node.right)
	elsif node.left.nil? && node.right.nil?
		temp = node
		min_of_right_subtree = find_min(node.right)
		node.value = min_of_right_subtree.value
		node.right = remove_element(min_of_right_subtree.value, node.right)
	elsif node.left.nil?
		node = node.left
	elsif node.right.nil?
		node = node.right
	else
		node = nil
	end
	node
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
puts "11.Enter the file name for previous values in BST"
puts "12.Quit"
root = BST.new()
loop_end = false
fileobject = File.new("element_file.txt","a+")
def elements_file(node = self.root)
	return if node.nill
	elements_file(node.left)
	fileobject.syswrite(node.value)
	elements_file(node.right)
end

def load_BST
	root = BST.new() 
	elements = fileobject.read()
	for i in 1..elements.length
		insert(value)
	end
end

while(!loop_end)
	operation_num = gets.chomp()
	operation_num.to_i
	case operation_num
	when 1
		elements = []
		print("How much values you want to add in BST:")
		num_values = gets.chomp()
		for i in 1..num_values
			value = gets()
			print(", ")
			insert(value)
		end
	when 2
		largest_element(root)
	when 3
		smallest_element(root)
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
		element = gets.chomp()
		search_element(root,element)
	when 9
		print("Enter element which you want to remove:")
		element = gets.chomp()
		print(remove_element(root,element))
	when 10
		print(all_paths(root))
  when 11
		name = gets()
		if name = element_file
			load_bst()
		end
	when 12
		elements_file(root)
		print("exit")
    loop_end = true
	else 
		"Default value"
	end
end
