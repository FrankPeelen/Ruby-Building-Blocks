# Contents of array must be integers
# Returns a sorted array according to Bubble Sort principles
def bubble_sort(array)
	(array.length - 1).downto(1) do |i|
		0.upto(i - 1) do |j|
			if array[j] > array[j + 1]
				array[j], array[j + 1] = array[j + 1], array[j]
			end
		end
	end
	return array
end

# Sorts array according to the sorting specified in the lambda
def bubble_sort_by(array, lambda)
	(array.length - 1).downto(1) do |i|
		1.upto(i - 1) do |j|
			if lambda.call(array[j], array[j + 1]) > 0
				array[j], array[j + 1] = array[j + 1], array[j]
			end
		end
	end
	return array
end

# Contents of array must be integers
# Runs the method bubble_sort and formats the output nicely
def run1(array)
	result = "["
	sorted_array = bubble_sort(array)
	for i in 0..(sorted_array.length - 2)
		result += "#{sorted_array[i]},"
	end
	result += "#{sorted_array[sorted_array.length - 1]}]"
	puts "Your sorted array is as follows:"
	puts result
end

# Runs the method bubble_sort_by and formats the output nicely
def run2(array, lambda)
	result = "["
	sorted_array = bubble_sort_by(array, lambda)
	for i in 0..(sorted_array.length - 2)
		result += "'#{sorted_array[i]}',"
	end
	result += "'#{sorted_array[sorted_array.length - 1]}']"
	puts "Your sorted array is as follows:"
	puts result
end

# Run code
unsorted = [4,3,78,2,0,2]
run1(unsorted)
unsorted_strings = ["hi","hello","hey"]
sorting = lambda { |left,right| left.length - right.length }
puts run2(unsorted_strings, sorting)