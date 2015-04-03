# stocks must be an array with integers only
# Returns an array with 3 integers: [Max Profit, Buy on day, Sell on day]
# If no profit can be made, result[0] == 0
def stock_picker(stocks)
	# Until the array stocks' size is 2 or less it will call the stock_picker method recursively for stocks[1..last]
	max_profit_on_days = stocks.length > 2 ? stock_picker(stocks[1..(stocks.length - 1)]) : [0, 0, 0]
	max_profit_on_days[1] += 1
	max_profit_on_days[2] += 1
	# Calculate the best sell day and the max profit if bought on day 1
	buy_day = 0
	for sell_day in 1..(stocks.length - 1)
		profit = stocks[sell_day] - stocks[buy_day]
		if profit > max_profit_on_days[0]
			max_profit_on_days[0] = profit
			max_profit_on_days[1] = buy_day + 1
			max_profit_on_days[2] = sell_day + 1
		end
	end
	# Return the result
	return max_profit_on_days
end

# Run the code for a given array of integers
def run(stocks)
	puts "List of stock prices:"
	i = 1
	stocks.each do |stock|
		puts "Day #{i}: #{stocks[i - 1]}$"
		i += 1
	end
	hindsight = stock_picker(stocks)
	puts "You would've made a maximum profit of #{hindsight[0]}$,\nif only you had bought on Day #{hindsight[1]} and sold on Day #{hindsight[2]}..."
end

# Run the code
stocks = [17,3,6,9,15,8,6,1,10]  # Must be an array of integers only
run(stocks)