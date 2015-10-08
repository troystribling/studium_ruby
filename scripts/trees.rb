class TreeNode
	attr_accessor :value, :children
	def initialize(value, children)
		@value = value
		@children = children
	end
end

i = TreeNode.new("I", [])
h = TreeNode.new("H", [])
g = TreeNode.new("G", [i])
f = TreeNode.new("F", [])
e = TreeNode.new("E", [h])
d = TreeNode.new("D", [])
c = TreeNode.new("C", [g])
b = TreeNode.new("B", [d,e,f])
a = TreeNode.new("A", [b,c])

def nodeList(root)
	nodeListTraverse([root])
end

$values = []

def nodeListTraverse(nodes)
	return if nodes.empty?
	$values << nodes.map(&:value)
	nodeListTraverse(nodes.map(&:children).flatten)
end

nodeList(a)
puts $values.map{|node| node.join('')}.join(',').inspect
