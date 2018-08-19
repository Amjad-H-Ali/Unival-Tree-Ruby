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

# Wrapper function
def how_many_univals root
	total_count, unival = count_unival(root).values_at(:count, :unival)

	total_count
end	




def count_unival root

	# IF ROOT DOES NOT EXIST, RETURN 0 AND TRUE
	if !root
		return {:count => 0, :unival => true}
	end
	# RECURSIVELY COUNT UNIVALS ON LEFT SIDE AND UNPACKAGE OBJECT
	left_count, left_unival = count_unival(root.get_left).values_at(:count, :unival)

	# RECURSIVELY COUNT UNIVALS ON RIGHT SIDE AND UNPACKAGE OBJECT
	right_count, right_unival = count_unival(root.get_right).values_at(:count, :unival)

	# Assume Root is unival unless one of following conditions are true
	is_unival = true

	# IF ONE OF THE ROOTS ARE NOT UNIVAL, SET VARIABLE TO FALSE
	if !left_unival or !right_unival
		is_unival = false
	end	
	# IF LEFT CHILD EXIST AND VALUE DOES NOT EQUAL PARENT ROOT, NOT UNIVAL
	if root.get_left and root.get_left.get_value != root.get_value
		is_unival = false
	end
	# IF RIGHT CHILD EXIST AND VALUE DOES NOT EQUAL PARENT ROOT, NOT UNIVAL
	if root.get_right and root.get_right.get_value != root.get_value
		is_unival = false
	end
	# IF VARIABLE IS STILL TRUE, ADD UP ALL UNIVALS AND 1 TO CONSIDER TREE ITSELF
	if is_unival
		return {:count => left_count + right_count + 1, :unival => true}
	# ELSE ONLY ADD CHILD UNIVALS	
	else
		return {:count => left_count + right_count, :unival => false}
	end			

end	




