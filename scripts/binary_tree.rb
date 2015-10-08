require 'minitest/autorun'

class ListNode
	attr_accessor :value, :next_node
	def initialize(value, next_node)
		@value = value
		@next_node = next_node
	end
end

class TreeNode
	attr_accessor :value, :left, :right

	def initialize(value)
		@value = value
	end

	def inorder(&blk)
		self.inorderNode(self, &blk)
	end

	def inorderNode(node, &blk)
		return if node.nil?
		self.inorderNode(node.left, &blk)
		blk.call(node) if block_given?
		self.inorderNode(node.right, &blk)
	end

	def is_bst
		self.prev = nil
		isBSTNode(self, nil)
	end

	def is_bst_node(node, prev)
		return true if node.nil?
		return false if !self.is_bst_node(node.left, prev)
		return false if prev && prev.value > node.value
		self.is_bst_node(node.right, node)
	end

	def max_bst
		self.max_bst_node(self)
	end

	def max_bst_node(node)
		node.right ? self.max_bst_node(node.right) : node.value
	end

	def reverse
	end

	def revers_nodes(node)
		return if node.nil?
	end

	def max
		self.max_node(self)
	end

	def max_node(node)
		maxValue = node.value
		if node.left
			maxLeft = self.maxNode(node.left)
			if  maxLeft > maxValue
				maxValue = maxLeft
			end
		end
		if node.right
			maxRight = self.maxNode(node.right)
			if maxRight > maxValue
				maxValue = maxRight
			end
		end
		maxValue
	end

	def height
		self.height_node(self)
	end

	def height_node(node)
		return 0 if node.nil?
		left_height = self.heightNode(node.left)
		right_height = self.heightNode(node.right)
		left_height > right_height ? (left_height +1) : (right_height + 1)
	end

	def print_levels
		self.print_levels_nodes([self])
	end

	def print_levels_nodes(nodes)
		return if nodes.empty?
		children = []
		puts nodes.map(&:value).join(' ').inspect
		nodes.each do |node|
			children << node.left if node.left != nil
			children << node.right if node.right != nil
		end
		print_levels_nodes(children)
	end

	def levels_lists
		self.levels_lists_nodes([self])
	end

	def levels_lists_nodes(nodes)
		return if nodes.empty?

	end

end

$bst_root = TreeNode.new(10)
n11 = TreeNode.new(5)
n12 = TreeNode.new(20)
n13 = TreeNode.new(1)
n14 = TreeNode.new(9)
n15 = TreeNode.new(15)
$bst_root.left = n11
$bst_root.right = n12
n11.left = n13
n11.right = n14
n12.left = n15

$bt_root = TreeNode.new(11)
n21 = TreeNode.new(5)
n22 = TreeNode.new(20)
n23 = TreeNode.new(9)
n24 = TreeNode.new(1)
n25 = TreeNode.new(25)
$bt_root.left = n21
$bt_root.right = n22
n21.left = n23
n21.right = n24
n22.left = n25

describe TreeNode do

	before do
		@bst_root = TreeNode.new(10)
		n11 = TreeNode.new(5)
		n12 = TreeNode.new(20)
		n13 = TreeNode.new(1)
		n14 = TreeNode.new(9)
		n15 = TreeNode.new(15)
		@bst_root.left = n11
		@bst_root.right = n12
		n11.left = n13
		n11.right = n14
		n12.left = n15

		@bt_root = TreeNode.new(11)
		n21 = TreeNode.new(5)
		n22 = TreeNode.new(20)
		n23 = TreeNode.new(9)
		n24 = TreeNode.new(1)
		n25 = TreeNode.new(15)
		@bt_root.left = n21
		@bt_root.right = n22
		n21.left = n23
		n21.right = n24
		n22.left = n25
	end

	describe "#inorder" do
		it "should return nodes in order" do
			vals = []
			@bst_root.inorder{|node| vals << node.value}
			vals.must_equal [1,5,9,10,15,20]
		end
	end

end
