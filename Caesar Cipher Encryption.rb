# Declare Necessary alphabet variables
@alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
@alphabet_upper = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

# char can be any character
# offset can be any integer
# If type == true, caesar ciphens char to the left
# If type == false, caesar ciphens char to the right
def caesar_cipher_char(char, offset, type)
	if position = @alphabet.index(char)
		type ? @alphabet[(position - offset) % 26] : @alphabet[(position + offset) % 26]
	elsif position_upper = @alphabet_upper.index(char)
		type ? @alphabet_upper[(position_upper - offset) % 26] : @alphabet_upper[(position_upper + offset) % 26]
	else
		char
	end
end

# string can be any string
# offset can be any integer
# If type == true, caesar ciphens string to the left
# If type == false, caesar ciphens string to the right
def caesar_cipher_string(string, offset, type)
	result = ""
	for i in 0..(string.length - 1)
		result += caesar_cipher_char(string[i], offset, type)
	end
	return result
end

# Return string == positive integer
def is_positive_int(string)
	!!(string =~ /^[0-9]+$/)
end


# Asks the user for a String to encrypt,
# a positive integer to use as encryption offset,
# and 'left' or 'right' to use as encryption type.
# The method will automatically output the encrypted string to the command line.
def encrypt
	# Ask the user for a string to encrypt
	puts "Please enter a string to be encrypted."
	string = gets
	# Ask the user for a positive integer to use as encryption offset
	offset = false
	until offset
		puts "Please enter a positive number for the encryption offset."
		offset_str = gets
		if is_positive_int(offset_str)
			offset = offset_str.to_i
		else
			puts "You did not enter a positive number."
		end
	end
	# Ask the user for 'left' or 'right' to use as encryption type.
	until false
		puts "Please enter 'left' or 'right' to set the type of encryption."
		encryption_type = gets.downcase
		if encryption_type.chomp == "left"
			type = true
			break
		elsif encryption_type.chomp == "right"
			break
		else
			puts "You did not enter 'left' or 'right'. These are the only acceptable inputs."
		end
	end
	# Output the encrypted string to the oommand line.
	puts "\nYour encrypted message is as follows:\n\n#{caesar_cipher_string(string, offset, type)}\nEncrypton style:\n\nCaesar Cipher\n#{encryption_type}#{offset}"
end

encrypt