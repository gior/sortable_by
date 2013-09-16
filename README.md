# SortableBy

Sort an ActiveRecord model by any attribute and represent it through a (possibly inverted) arrow image.

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
sortable_by :date_of_birth, :direction => :descending
```

**Enabling the view**
1. add input fields inside your form:
```ruby
<%= sorting_fields %>
```

2. add controls:
```ruby
<%= sort_by :name %>
<%= sort_by :date_of_birth, “Age”, 'descending', 'invert' %>
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

**Note** method was set to 'GET' in order to call the index action without touching routes.
Beware of size limits for a GET parameter string (NNN chars). If your parameters are likely to exceed this limit, use a standard POST request (just remove the method attribute) and route it accordingly in your routes.rb file.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
