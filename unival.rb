p "Unival Tree!"

class Tree 

	def initialize value
		@value = value

		@left = nil

		@right = nil
	end

	def get_value
		@value
	end

	def get_left
		@left
	end

	def get_right
		@right
	end	

	def set_left value
		@left = value
	end
	
	def set_right value
		@right = value
	end		

end


root = Tree.new 5

root.set_left Tree.new 1

root.set_right Tree.new 5

root.get_left.set_left Tree.new 5

root.get_left.set_right Tree.new 5

root.get_right.set_right Tree.new 5


p root.get_value

p root.get_left.get_value

p root.get_right.get_value

p root.get_left.get_left.get_value

p root.get_left.get_right.get_value

p root.get_right.get_right.get_value





