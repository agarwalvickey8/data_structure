class TreeNode
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

	def insert(value)
		if self.root.nil?
			self.root = TreeNode.new(value) 
		else 
			current_node = self.root 
			previous_node = self.root 
			while current_node 
				previous_node = current_node 
				value < current_node.value ? current_node.left : current_node = current_node.right
			end
			if value < previous_node.value
				previous_node.left = TreeNode.new(value)
			else 
				previous_node.right = TreeNode.new(value)
			end
		end
	end

	def largest_element(node = self.root)
		return node if node.nil?
		return node.value if node.right.nil?
		largest_element(node.right)
	end

	def smallest_element(node = self.root)
		return node if node.nil?
		return node.value if node.left.nil?
		smallest_element(root.left)
	end

	def in_order(node = self.root)
		return if node.nil?
		in_order(node.left)
		print "#{node.value} "
		in_order(node.right)
	end

	def pre_order(node = self.root)
		return if node.nil?
		print "#{node.value} "
		pre_order(node.left)
		pre_order(node.right)
	end

	def post_order(node = self.root)
		return if root.nil?
		post_order(node.left)
		post_order(node.right)
		print "#{node.value} "
	end  

	def search_element(element, node = self.root)
		return false if node.nil?
		return search_element(node.left, element) if element < node.value
		return search_element(node.right, element) if node.value < element
		true
	end

	def all_path(elements, node = self.root)
		return if node.nil?
		elements.push(node.value)
		print "#{elements} " if node.left.nil? && node.right.nil?
		all_path(elements, node.left)
		all_path(elements, node.right)
		elements.pop()
	end

	def remove_element(value, node = self.root)
		return nil if node.nil?
		if value < node.value
			node.left = remove_element(value, node.left)
		elsif node.value < value
			node.right = remove_element(value, node.right)
		else
			if node.left.nil? && node.right.nil?
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
		end
		node
	end

	def add_elements_to_file(fileobject, node = self.root)
		return if node.nil?
		add_elements_to_file(fileobject, node.left)
		fileobject.write("#{node.value}")
		add_elements_to_file(fileobject, node.right)
	end

	def load_BST
		bst = BST.new
		elements = File.open("file.txt", "w+")
		elements.each |element| bst.insert(element)
		bst
	end
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
bst = BST.new
while true
	operation_num = gets.chomp
	case operation_num.to_i
	when 1
		puts "Enter values which you want to add in BST separated by comma:"
		element_values = gets
		element_values_array = element_values.split(",")
		element_values_array.each { |element| bst.insert(element.to_i) }
	when 2
		print bst ? bst.largest_element : "Currently BST is empty"
	when 3
		print bst ? bst.smallest_element : "Currently BST is empty"
	when 4
		bst.in_order
	when 5
		bst.post_order
	when 6
		bst.level_order
	when 7
		bst.pre_order
	when 8
		print "Enter element which you want to search:"
		element = gets
		print bst.search_element(element.to_i)
	when 9
		print "Enter element which you want to remove:"
		element = gets.chomp
		bst.remove_element(element.to_i)
	when 10
		elements = Array.new
		bst.all_path(elements)
	when 11
		name = gets
		if name == "file"
			bst = bst.load_BST
		else
			puts "Wrong file name!"
		end
	when 12
		fileobject = File.new("elements.txt", "w+")
		bst.add_elements_to_file(fileobject)
		fileobject.close
		break
	else
		puts "Please enter value from given options"
	end
end
