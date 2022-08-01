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
    self[0] if !self[0].is_a?(Array)
    return [] if self[0].length == 0
    # flattened = self[0].my_flatten + self[1..-1].my_flatten
    self.each { |el| flattened += el.my_flatten}
    flattened

  end
  # def my_flatten(array=self)
  #   return [self] if !self.is_a?(Array)
  #   return [] if self.length == 0
  # end

end

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten









