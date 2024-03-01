module Searchable
  def self.included(base)
    base.class_eval do
      attr_reader :list

      include InstanceMethods
    end
  end

  module InstanceMethods
    def b_search(element)
      i = 0
      j = list.length - 1
      iterations = 0

      while i <= j
        iterations += 1
        middle = (i + j) / 2

        if element == list[middle]
          puts "Element found in position #{middle}.\n"
          puts "#{iterations} iterations needed.\n"

          return middle
        end

        if element < list[middle]
          j = middle - 1
        else
          i = middle + 1
        end
      end

      puts "Element not present in list."
    end
  end
end
