# given a list of integers, find the smallest number
# runtime: O(n), where n is the length of the array passed
def my_min(arr)
  min_number = arr[0]
  i = 1

  while i < arr.length
    min_number = arr[i] if arr[i] < min_number
    i += 1
  end

  min_number
end

# given an array of ints, find the largest contiguous subsum
# runtime: O(n^2), where n is the length of the array passed
def largest_contiguous_subsum_slow(arr)
  res = arr.first
  (0...arr.length - 1).each do |i|
    (i+1...arr.length).each do |j|
      tmp_sum = arr[i..j].reduce(:+)
      res = tmp_sum if tmp_sum > res
    end
  end
  return res
end

# runtime: O(n), where n is the length of the array
def largest_contiguous_subsum(arr)


end


list = [3, -1, -3, 1, 1, 8, 10, -5, -3, 4, 90, -7]
p largest_contiguous_subsum(list) # => 8



# anagrams
# runtime: O(n)
def fourth_anagram(str1, str2)
  return false if str1.length != str2.length

  hash = Hash.new(0)
  str1.each_char do |let|
    hash[let] += 1
  end
  str2.each_char do |let|
    hash[let] -= 1
  end

  hash.values.all? { |el| el == 0 }
end

def two_sum?(arr, target_sum)
  hash = Hash.new
  arr.each do |el|
    return true if hash.keys.include?(target_sum - el)
    hash[el] = 0
  end
  false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
