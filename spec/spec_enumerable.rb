require "../Enumerable.rb"
require "./spec_helper.rb"

describe "Enumerable" do
	let(:int_array) { arr = [1, 2, 4, 2, 7, 8, 12, 15, 17] }
	let(:string_array) { ["ant", "bear", "cat"] }

	describe "#my_select" do
		it "equals select" do
			
			int_array.my_select { |x| x < 10 }.should == int_array.select { |x| x < 10 }
		end
	end

	describe "#my_all?" do
		context "result == true" do
			it "equals all?" do
				string_array.my_all? {|word| word.length >= 3} == string_array.all? {|word| word.length >= 3}
			end
		end

		context "result == false" do
			it "equals all?" do
				string_array.my_all? {|word| word.length >= 4} == string_array.all? {|word| word.length >= 4}
			end
		end
	end

	describe "#my_any" do
		context "result == true" do
			it "equals any?" do
				string_array.my_any? {|word| word.length < 4} == string_array.any? {|word| word.length < 4}
			end
		end

		context "result == false" do
			it "equals any?" do
				string_array.my_any? {|word| word.length < 3} == string_array.any? {|word| word.length < 3}
			end
		end
	end

	describe "#my_none" do
		context "result == true" do
			it "equals none?" do
				string_array.my_none? {|word| word.length == 5} == string_array.none? {|word| word.length == 5}
			end
		end

		context "result == false" do
			it "equals none?" do
				string_array.my_none? {|word| word.length >= 4} == string_array.none? {|word| word.length >= 4}
			end
		end
	end

	describe "#my_count" do
		context "no argument" do
			context "no block" do
				it "int_array equals count" do
					int_array.my_count == int_array.count
				end

				it "string_array equals count" do
					string_array.my_count == string_array.count
				end
			end

			context "block" do
				it "int_array equals count" do
					int_array.my_count { |x| x % 2 == 0 } == int_array.count { |x| x % 2 == 0 }
				end

				it "string_array equals count" do
					string_array.my_count { |x| x % 2 == 0 } == string_array.count { |x| x % 2 == 0 }
				end
			end
		end

		context "argument" do
			it "int_array equals count" do
				int_array.my_count(2) == int_array.count(2)
			end

			it "string_array equals count" do
				string_array.my_count(2) == string_array.count(2)
			end
		end
	end

	describe "#my_map" do
		context "integer array" do
			it "equals map" do
				int_array.my_map {|i| i*i } == int_array.map {|i| i*i }
			end
		end

		context "string array" do
			it "equals map" do
				string_array.my_map { "cat"  } == string_array.map { "cat"  }
			end
		end
	end

	describe "#my_inject" do
		context "integer array" do
			context "argument" do
				it "equals inject" do
					int_array.my_inject(1) { |sum, n| sum + n } == int_array.inject(1) { |sum, n| sum + n }
				end
			end

			context "no argument" do
				it "equals inject" do
					int_array.my_inject(1) { |product, n| product * n } == int_array.inject(1) { |product, n| product * n }
				end
			end
		end

		context "string array" do
			it "equals inject" do
				string_array.my_inject { |memo,word| memo.length > word.length ? memo : word } == string_array.inject { |memo,word| memo.length > word.length ? memo : word }
			end
		end
	end
end