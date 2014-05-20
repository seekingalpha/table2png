# Table2PNG

A simple PNG generator based on an HTML table.

## Installation

Add this line to your application's Gemfile:

    gem 'table2png'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install table2png

## Usage

```ruby                                              
# e.g. Table2PNG table_html
Table2PNG::Converter.new("<table><tr><td>HEY</td></tr></table>").process
```
   
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
