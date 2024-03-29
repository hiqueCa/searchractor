# frozen_string_literal: true

# Internal: Namespace module dedicated to ListNotSortedError class
module Searchractor
  # Internal: Searchractor's custom ListNotSortedError class
  class ListNotSortedError < StandardError
    # Internal: Overrides StandardError#message to return
    #  class specific error message when raised.
    def message
      'The list of elements is not sorted.'
    end
  end
end
