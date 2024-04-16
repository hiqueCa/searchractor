require 'searchractor/list_not_sorted_error'

# Public: Searchractor's methods.
module Searchractor
  # Internal: Add Searchractor's behaviour in the including class.
  def self.included(base)
    base.class_eval do
      # Public: Defines an initialized @list as readable in the including class.
      # Same as doing the following in the calling class:
      #
      # class CallingClass
      #   attr_reader :list
      #
      #   def initialize(list)
      #     @list = list
      #   end
      # end
      attr_reader :list, :search_results

      extend ClassMethods
    end
  end

  def initialize(list)
    @list = list
    @search_results = {}
  end

  # Public: Use binary search to look for an element in an initialized list of sorted elements.
  #
  # Examples
  #
  #   searchable = SearchractorClass.new([1, 2, 3, 5, 8])
  #
  #   searchable.b_search(5) => 3
  #
  #   searchable.b_search(10) => nil
  #
  # Returns either the index of the searched element or nil if the element is not found
  #  in the sorted list
  def b_search(element)
    validate_sorted_list
    
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
  
  # Public: Use linear search to look for an element in an initialized list of elements.
  #
  # Examples:
  #
  #   searchable = SearchractorClass.new([1, 4, 3, 8, 6])
  #
  #   searchable.l_search(3) => 2
  #
  #   searchable.l_search(10) => nil
  # 
  # Returns either the index of the searched element or nil if the element is not found
  #  in the list
  def l_search(element)
    i = 0

    while i <= list.length - 1
      i += 1

      return i if element == list[i]
    end
  end

  private

  # Private: Validation to check if searchable list is indeed sorted.
  # 
  # Used by search_methods that require previous sorted list of elements,
  #  such as #b_search.
  #
  # Raises an Searchractor::ListNotSortedError if initialized list of elements
  #  is not sorted.
  def validate_sorted_list
    raise Searchractor::ListNotSortedError if list.sort != list
  end

  module ClassMethods
    def search_by(*searches)
      @searches = searches
    end

    def search(list: , element: )
      searchable_instance = new(list)

      @searches.each do |search|
        search_result = searchable_instance.send(search, element)

        searchable_instance.search_results[search] = search_result
      end

      searchable_instance.search_results
    end
  end
end
