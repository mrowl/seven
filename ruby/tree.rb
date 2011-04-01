class Tree
    attr_accessor :children, :node_name

    def initialize(tree_hash={})
        @node_name = tree_hash.keys[0]
        @children = []
        sub_hash = tree_hash.values[0]
        add_children(sub_hash) unless sub_hash.empty?
    end

    def add_children(tree_hash)
        p tree_hash
        tree_hash.each {|child_name, child_children| children.push(Tree.new({child_name => child_children}))}
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end
ruby_tree = Tree.new({'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}})

puts "visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all{|node| puts node.node_name}
