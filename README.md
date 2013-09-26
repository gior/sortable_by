# SortableBy

Easily sort an ActiveRecord model by any attribute and display the results in a speaking fashion.

## DISCLAIMER: Work in progress
This gem is still in development.
It's being developed "readme first" in order to identify target features clearly.
Seeing a feature here does not mean it's available.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sortable_by'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sortable_by

## Usage

**Declaring sortable attributes in the model**
```ruby
sortable_by :name
sortable_by :date_of_birth, 'desc'
```

**Enabling the view**
1. add input fields inside your form:
```ruby
<%= sorting_fields %>
```

2. add controls:
```ruby
<%= sort_by :name %>
<%= sort_by :date_of_birth, “Age”, 'desc', 'invert' %>
```

sort_by follows this signature:
```ruby
sorting_control(attribute, label = nil, dir = nil, invert_arrow=nil)
```

## Example
The simplest form you could write to sort by price a list of products is:
```ruby
<form action="<%= products_path %>" method="get">
    <%= sorting_fields %>
    <%= sorting_control :price %>
    <%= yield %>
</form>
```

**Note** form method was set to GET in order to allow unique urls (and to call the index action without touching routes).
Beware of size limits for a GET parameter string. If your parameters are too bulky, use a standard POST request (just remove the method attribute) and route it accordingly in your routes.rb file.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write your **tests** and code
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
