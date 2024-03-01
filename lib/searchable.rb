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

      while i <= j
        middle = (i + j) / 2

        return middle if element == list[middle]

        if element < list[middle]
          j = middle - 1
        else
          i = middle + 1
        end
      end
    end
  end
end
