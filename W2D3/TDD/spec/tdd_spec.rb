# Remove dups
#
# Array has a uniq method that removes duplicates from an array. It returns the unique elements in the order in which they first appeared:
#
# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
# Write your own version of this method called my_uniq; it should take in an Array and return a new array.

require 'tdd'
require 'rspec'

RSpec.describe Array do


  describe "#my_uniq" do
    subject(:arr) { Array.new([1,2,1,3,3,]) }

    it "returns the unique elements in the order in which they first appeared" do
      expect(arr.my_uniq).to eq([1,2,3])
    end

    it "return an empty array if array is empty" do
      expect([].my_uniq).to eq([])
    end

    it "should return a new array" do
      expect(arr.my_uniq).to_not be(arr)
    end
  end

  # Two sum

  # Write a new Array#two_sum method that finds all pairs of positions where the elements at those positions sum to zero.
  #
  # NB: ordering matters. We want each of the pairs to be sorted smaller index before bigger index. We want the array of pairs to be sorted "dictionary-wise":
  #
  # [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
  # [0, 2] before [2, 1] (smaller first elements come first)
  # [0, 1] before [0, 2] (then smaller second elements come first)

  describe "#two_sum" do

    subject(:arr) { Array.new([-1, 1, 1, 0, -1]) }

    it "should find all pairs of positions where the elements at those positions sum to zero." do
      expect(arr.two_sum).to eq([[0,1],[0,2],[1,4],[2,4]])
    end

    it "should return an empty arr if no pair add to zero" do
      expect([1, 1].two_sum).to be_empty
    end

    context "when the result returns in order" do
      it "smaller first elements come first" do
        expect(arr.two_sum).to eq([[0,1],[0,2],[1,4],[2,4]])
      end

      it "then smaller second elements come first" do
        expect(arr.two_sum).to eq([[0,1],[0,2],[1,4],[2,4]])
      end
    end
  end
  #   My Transpose
  #
  # To represent a matrix, or two-dimensional grid of numbers, we can write an array containing arrays which represent rows:
  #
  # rows = [
  #     [0, 1, 2],
  #     [3, 4, 5],
  #     [6, 7, 8]
  #   ]
  #
  # row1 = rows[0]
  # row2 = rows[1]
  # row3 = rows[2]
  # We could equivalently have stored the matrix as an array of columns:
  #
  # cols = [
  #     [0, 3, 6],
  #     [1, 4, 7],
  #     [2, 5, 8]
  #   ]
  # Write a method, my_transpose, which will convert between the row-oriented and column-oriented representations. You may assume square matrices for simplicity's sake. Usage will look like the following:
  #
  describe "#my_transpose" do

    subject(:array) { Array.new([[0,1, 2], [3, 4,5], [6,7,8]]) }

    it "return the tranpose of the original" do
      expect(array.my_transpose).to eq([[0,3,6], [1,4,7], [2,5,8]])
    end

    context "when it returns" do
      it "should not modify the orignial array" do
        array.my_transpose
        expect(array).to be(array)
      end

      it "should return itself if it only has one element" do
        expect([[1]].my_transpose).to eq([[1]])
      end

      it "should return a new array" do
        expect(array.my_transpose).to_not be(array)
      end
    end

  end
  # Stock Picker
  #
  # Write a method that takes an array of stock prices (prices
  # on days 0, 1, ...), and outputs the most profitable pair of
  # days on which to first buy the stock and then sell the
  # stock. Remember, you can't sell stock before you buy it!

  describe "#stock_picker" do
    subject(:stocks) { Array.new([6,8,9,1,3,7]) }

    it "can only take integer values" do
      expect { ["1", "2", "3", 4, 5, 6].stock_picker }.to raise_error(ArgumentError)
    end

    it "should return the most profitable pair indices" do
      expect(stocks.stock_picker).to eq([3,5])
    end

    it "first value must be less than second value" do
      result = stocks.stock_picker
      expect(result[1]).to be > result[0]
    end

    it "should return nil if there is no profitable pair" do
      expect([1, 1, 1, 1].stock_picker).to be_nil
      expect([9, 8, 7, 6].stock_picker).to be_nil
    end

    it "should return nil if any stock price is negative" do
      expect([-1, 4, 5, 6].stock_picker).to be_nil
    end
  end
end
