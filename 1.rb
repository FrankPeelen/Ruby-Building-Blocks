@alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

def caesar_cipher(string, offset, type)
	return string
end

# Still need to check whether user input follows guidelines
puts "Please enter a string to be encrypted."
string = gets
puts "Please enter a number for the encryption offset."
offset = gets.to_i
puts "Please enter 'left' or 'right' to set the type of encryption."
encryption_type = gets
encryption_type == "left" ? type = true : type = false

# Puts result
puts "\nYour encrypted message is as follows:\n\n#{caesar_cipher(string, offset, type)}\nEncrypton style:\n\nCaesar Cipher\n#{encryption_type}#{offset}"