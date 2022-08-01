# Some message from payton
class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
  end

  def my_select(&prc)
    new_arr = Array.new
    self.my_each { |el| new_arr << el if prc.call(el) }
    new_arr
  end

  def my_reject(&prc)
    new_arr = Array.new
    self.my_each  { |el| new_arr << el if !prc.call(el) }
    new_arr
  end

  def my_any?(&prc)
    self.my_each  { |el| return true if prc.call(el) }
    false
  end

  def my_all?(&prc)
    self.my_each  { |el| return false if !prc.call(el) }
    true
  end

  def my_flatten
    flattened = []
    self.each do |subarr|
      if !subarr.is_a?(Array)
        flattened << subarr #single el, not array
      else
        flattened += subarr.my_flatten
      end
    end
    flattened
  end
end
p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten









