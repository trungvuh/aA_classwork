
def sum_to(n)
  return nil if n < 1
  return 1 if n == 1
  n + sum_to(n - 1)
end

def add_numbers(nums_array)
  return nums_array.first if nums_array.length <= 1
  nums_array.last + add_numbers(nums_array[0...-1])
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1
  (n-1) * gamma_fnc(n - 1)
end

def ice_cream_shop(flavors, favorite)
  if flavors.empty?
    return false
  elsif flavors.length == 1
    return (flavors.first == favorite)
  end

  # return true if ice_cream_shop(flavors[0...-1], favorite) == true
  (flavors.last == favorite) || ice_cream_shop(flavors[0...-1], favorite)
end

def reverse(string)
  return string if string.length <= 1
  reverse(string[1..-1]) + string[0]
end
