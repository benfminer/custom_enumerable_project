module Enumerable
  # Your code goes here
  def my_each_with_index
    self.each_with_index do |elem, index|
      yield(elem, index)
    end
  end

  def my_select
    arr = []

    for item in self
      arr << item if yield(item)
    end
    
    arr
  end

  def my_all?
    value = true

    self.each do |item|
      value = yield(item)
    end
    value
  end

  def my_any?
    self.my_each do |item|
      if yield(item) == true
        return true
      end
    end
    false
  end

  def my_none?

    self.my_each do |item|
      if yield(item) == true
        return false
      end
    return true
    end
  end

  def my_count
    count = 0
    
    self.my_each do |item|

      if block_given?
        count += 1 if yield(item)
      else
        count += 1
      end
    end
    return count
  end

  def my_map
    arr = []

    self.my_each do |item|
      arr << yield(item)
    end
    return arr
  end

  def my_inject(initial_value)
    self.my_each_with_index do |item|
      initial_value = yield(initial_value, item)
    end
    return initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |elem|
      yield(elem)
    end
  end
end
