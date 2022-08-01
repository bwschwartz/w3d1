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
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

  def my_zip(*arrs)
    zip_arr = Array.new(self.length) {Array.new()}
    arrs.each_with_index do |arr, i|
        arr.each_with_index do |ele, j|
            zip_arr[j] << ele if j < zip_arr.length
        end
    end

    for i in (0...self.length) do
        zip_arr[i].unshift(self[i])
    end

    return zip_arr
  end

  def my_rotate(amount=1)
    rotated = []

    if amount > 0
      amount.times do
        first = self[0]
        self.delete_at(0)
        rotated << first
        p first
      end
    else
      (-amount).times do
        last = self.pop
        self.unshift(last)
      end
      return self
    end
    return self + rotated
  end

  def my_join(sep="")
    new_str = ""
    i=0
    self.my_each do |el|
      if sep == ""
        new_str += el
      else
        if i < self.length - 1
          new_str += el + sep
        else
          new_str += el
        end
      end
      i += 1
    end
    new_str
  end

  def my_reverse
    new_arr = []
    (self.length-1).downto(0).to_a.my_each do |index|
      new_arr << self[index]
    end
    new_arr
  end

  def bubble_sort!(&prc)
    sorted = false
    while !sorted
        sorted = true
        for i in (0...self.length-1)
            if prc.call(self[i]) < prc.call(self[i+1])
                self[i], self[i+1] = self[i+1], self[i]
                sorted = false
            end
        end
    end
    return self
  end

end

############

p [1, 2, 4, 6, 8, 5].bubble_sort!{|ele| ele + 5}

def factors(num)
    (1..num).select {|i| num % i == 0}
end




