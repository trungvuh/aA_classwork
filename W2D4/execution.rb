# my_min
#
# Given a list of integers find the smallest number in the list.
#
# Example:
#
#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5
# Phase I
#
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?
#
# Phase II
#
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?
#
# Largest Contiguous Sub-sum
#
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.
#
# Example:
#
#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8
#
#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
# Example 2:
#
#     list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# Example 3:
#
#     list = [-5, -1, -3]
#     largest_contiguous_subsum(list) # => -1 (from [-1])
# Phase I
#
# Write a function that iterates through the array and finds all sub-arrays using nested loops. First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.
#
# Discuss the time complexity of this solution.
#
Phase II

Let's make a better version. Write a new function using O(n) time with O(1) memory. Keep a running tally of the largest sum.

Get your story straight, and then explain your solution's time complexity to your TA.

def my_min_1(list)
  list.each do |i|
    return list[i] if list.all? { |j| list[j] > list[i] }
  end
end

def my_min_2(list)
  min = list.first
  list.each do |i|
    min = list[i] if list[i] < min
  end
  min
end

def sub_sum_1(array)
  sub_array = []
  (0...array.length).each do |i|
    (i...array.length).each do |j|
      sub_array << array[i..j]
    end
  end
  p sub_array
  result = []
  # result = []
  # i = 0
  # while i < sub_array.length
  #   j = i + 1
  #   while j < sub_array.length #i = [1], j = [1,2]
  #     result << i += j
  #     j += 1
  #   end
  #   i += 1
  # end #el2 = 1
  # p result
  sub_array.each { |el| result << el.reduce(:+) }
  p result

  largest = result.first
  result.each {|num| largest = num if num > largest}
  largest
end

puts sub_sum_1([9,-3,8,2])

def liniar_sum(arr)
  largest = arr.first
  sub_largest = arr.first

  arr.each do |n|
    # next if n < 0
    sub_largest += n
    if sub_largest < 0
      sub_largest = 0
    end
    largest = sub_largest if sub_largest > largest
  end

  largest
end
