module Enumerable
    def my_each
    	for x in self
    		yield(x)
    	end
    end

    def my_each_with_index
    	for i in 0..(size - 1)
    		yield(self[i], i)
    	end
    end

    def my_select
    	result = []
    	self.my_each { |x| result << x if yield(x) }
    	return result
    end

    def my_all?
    	self.my_each { |x| return false if !yield(x) }
    	true
    end

    def my_any?
    	self.my_each { |x| return true if yield(x) }
    	false
    end

    def my_none?
    	self.my_each { |x| return false if yield(x) }
    	true
    end

    def my_count(*args)
    	return self.size if !args[0] && !block_given?
    	count = 0
    	self.my_each { |x| count += 1 if x == args[0] || (block_given? && yield(x)) }
    	return count
    end

    def my_map()
    	result = []
    	self.my_each { |x| result << yield(x) }
    	return result
    end

    def my_inject(*args)
    	start = 0
    	memo = 0
    	if args[0]
    		memo = args[0]
    	else
    		memo = self.to_a[0]
    		start = 1
    	end
    	for x in start..(self.my_count - 1)
    		memo = yield(memo, self.to_a[x])
    	end
    	return memo
    end

    def alt_my_map(*args)
    	result = []
    	if !args[0]
    		self.my_each { |x| result << yield(x) }
    		return result
    	else
    		my_map(&args[0])
    	end
    end
end

# Test my_each
#[3,4,5,6,7].my_each { |x| puts x }

# Test my_each_with_index
#["A","B","C","D","E"].my_each_with_index { |x,y| puts x + " at index #{y}" }

# Test my_select
#puts [1,4,6,10,15].my_select { |x| x < 10 }.to_s

# Test my_all?
#puts ["ant", "bear", "cat"].my_all? {|word| word.length >= 3}
#puts ["ant", "bear", "cat"].my_all? {|word| word.length >= 4}

# Test my_any?
#puts ["ant", "bear", "cat"].my_any? {|word| word.length < 3}
#puts ["ant", "bear", "cat"].my_any? {|word| word.length < 4}

# Test my_none?
#puts ["ant", "bear", "cat"].my_none? {|word| word.length == 5}
#puts ["ant", "bear", "cat"].my_none? {|word| word.length >= 4}

# Test my_count
#ary = [1, 2, 4, 2, 7, 8, 12, 15, 17]
#puts ary.my_count
#puts ary.my_count(2)
#puts ary.my_count{ |x| x % 2 == 0 }

# Test my_map
#puts (1..4).my_map {|i| i*i }.to_s
#puts (1..4).my_map { "cat"  }.to_s

# Test my_inject
#puts (5..10).my_inject { |sum, n| sum + n }
#puts (5..10).my_inject(1) { |product, n| product * n }
#puts ["cat", "sheep", "bear"].my_inject { |memo,word| memo.length > word.length ? memo : word }

# Test alt_my_map
#test = Proc.new {|i| i*i }
#puts (1..4).alt_my_map(test).to_s
#puts (1..4).alt_my_map {|i| i*i }.to_s
#puts (1..4).alt_my_map(test) { "cat"  }.to_s