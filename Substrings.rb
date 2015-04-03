# string can be any string
# dictionary must be an array of strings
# This method returns a hash containing where for each s = substring in dictionary
# and c = count of s in string: {:s => c}
def substrings(string, dictionary)
	result = {}
	result.default = 0
	dictionary.each do |substring|
		string.scan(/#{substring}/) do |word|
			result[word.to_sym] += 1
		end
	end
	return result
end

# string can be any string
# dictionary must be an array of strings
# Does the same as method substrings, but formats everything nicely
def run(string, dictionary)
	puts "In the string:\n#{string}\n"
	substrings(string, dictionary).each do
		|substring, count|
		puts "\n'#{substring}' was found #{count.to_s} times."
	end
end

# Run the code
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
string = "Howdy partner, sit down! How's it going?"
run(string, dictionary)