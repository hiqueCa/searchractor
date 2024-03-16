# frozen_string_literal: true

module Searchractor
  class ListNotSortedError < StandardError
    def initialize(msg='The list of elements is not sorted.')
      super
    end
  end
end
