# searchractor 🔍 ♦️

## Description
`searchractor` is a Ruby gem designed to provide a module that can be included in classes to enable efficient binary search operations on a sorted list of elements. Originally conceived as a tool for studying Ruby metaprogramming and search algorithms, it has evolved into a versatile module suitable for various applications where efficient searching is required.

## Installation 👷
You can install `searchractor` via RubyGems by adding it to your Gemfile:

```ruby
gem 'searchractor', '~> 1.0'
```

And then executing:

```bash
$ bundle install
```

Or install it manually via:

```bash
$ gem install searchractor
```

## Usage 📖
To use `searchractor`, simply include the module `Searchractor` in your class definition, along with implementing a sorted list of elements. Here's a step-by-step guide:

1. **Include the `Searchractor` module:**
   Include the `Searchractor` module in your class definition.

   ```ruby
   class SearchractorClass
     include Searchractor
   end
   ```

2. **Implement a sorted list:**
   Ensure that your class has an instance variable `@list` containing a sorted list of elements. This list will be used for binary search operations.

   ```ruby
   class SearchractorClass
     include Searchractor

     def initialize(list)
       @list = list # Example sorted list
     end
   end
   ```

3. **Perform binary search:**
   You can now utilize the `#b_search` method provided by `searchractor`.

   ```ruby
   searchractor_class_instance = SearchractorClass.new([1, 2, 4, 7, 9, 11, 25])
   index = searchractor_class_instance.b_search(7)
   puts "Element found at index: #{index}" if index
   ```

   This will output:

   ```
   Element found at index: 3
   ```

   If the element is not found, `#b_search` will return `nil`.

## Example
Here's a more straight forward example demonstrating the usage of `searchractor`:

```ruby
class SearchractorClass
  include Searchractor

  def initialize(list)
    @list = list # Example sorted list
  end
end

searchractor_class_instance = SearchractorClass.new([1, 3, 5, 7, 9, 11, 13])
index = searchractor_class_instance.b_search(7)
puts "Element found at index: #{index}" if index
```

## Contributing
Contributions are welcome! Feel free to open issues or submit pull requests on the [GitHub repository](https://github.com/hiqueCa/searchractor).

## License
This gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
