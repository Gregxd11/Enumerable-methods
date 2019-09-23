module Enumerable
    def my_each
        i = 0
        while i < self.length
            yield(self[i])
            i += 1
        end
    end

    def my_each_with_index
      i = 0
      while i < self.length
        yield(self[i], [i])
        i += 1
        end
    end

    def my_select
      result = []
      self.my_each { |i|
        if yield(i)
          result << i
        end
        }
      return result
    end

    def my_all?
      result = 0
      self.my_each {|i|
        if !yield(i)
          result += 1
        end
      }
      result == 0 ? "true" : "false"
    end

    def my_any?
      result = 0
      self.my_each {|i|
        if yield(i)
          result += 1
        end
      }
      result > 0 ? "true" : "false"
    end

    def my_none?
      result = 0
      self.my_each {|i|
        if yield(i)
          result += 1
        end
      }
      result == 0 ? "true" : "false"
    end

    def my_count
      result = 0
      self.my_each{ |i|
        if yield(i)
          result += 1
        end
      }
      return result
    end

    def my_map(*proc)
      result = []
      if proc.count == 0
        self.my_each { |i|
          result << yield(i)
        }
      else 
        proc = procs[0]
          self.my_each(&proc)
      end
      return result
    end
    
    def my_inject(*first_num)
        result = 0
        if first_num.count == 0
            self.my_each {|n|
                result = yield(result, n)
            }
        return result
        else
            first_num = first_num[0]
            self.my_each {|n|
                first_num = yield(first_num, n)
            }
            return first_num
        end
    end
end

proc = Proc.new {|x| x * 2}

arr = [1, 2, 3, 4]
puts arr.my_map {|x| x * 3 }