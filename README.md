[![Code Climate](https://codeclimate.com/github/seekingalpha/table2png.png)](https://codeclimate.com/github/seekingalpha/table2png)

[![Build Status](https://travis-ci.org/seekingalpha/table2png.svg)](https://travis-ci.org/seekingalpha/table2png)

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
Table2PNG::Converter.new("<table><tr><td>HEY</td></tr></table>").process # default style public/table.css
or you can pass any style you want by
Table2PNG::Converter.new("<table><tr><td>HEY</td></tr></table>").process ['public/style.css']
```
   
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
