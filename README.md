# SupermarketApi

[![Build Status](https://secure.travis-ci.org/mhuggins/supermarket_api.png)](http://travis-ci.org/mhuggins/supermarket_api)
[![Code Climate](https://codeclimate.com/github/mhuggins/supermarket_api.png)](https://codeclimate.com/github/mhuggins/supermarket_api)

supermarket_api is a Ruby gem that makes it easy to communicate with the
[Supermarket API](http://www.supermarketapi.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'supermarket_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install supermarket_api

## Usage

After including the gem in your project, instantiate a new `SupermarketApi::Client` instance.

```ruby
client = SupermarketApi::Client.new('YOUR_API_KEY')
```

All API calls happen through your `Client` instance.  Each call counts towards the use of any rate
limiting or costs associated with the service.

### Products

* `#product_search_by_id` - Given an item ID, returns a `SupermarketApi::Product` object.
* `#product_search_by_name` - Given an item name, returns an array of `SupermarketApi::Product`
  objects.
* `#product_search` - Given an item name and store ID, returns an array of
  `SupermarketApi::Product` objects.
* `#commercial_product_search_by_id` - Given an item ID, returns a `SupermarketApi::Product` object
  (including price information).
* `#commercial_product_search_by_name` - Given an item name, returns an array of
  `SupermarketApi::Product` objects (including price information).
* `#commercial_product_search` - Given an item name and store ID, returns an array of
  `SupermarketApi::Product` objects (including price information).

### Stores

* `#stores_by_name` - Given a name, returns an array of `SupermarketApi::Store` objects.
* `#stores_by_city_state` - Given a city and state code, returns an array of
  `SupermarketApi::Store` objects.
* `#stores_by_zip` - Given a zip code, returns an array of `SupermarketApi::Store` objects.

### Groceries

TODO

### States

TODO

### Cities

TODO

## Contributing

1. Fork it ( https://github.com/[my-github-username]/supermarket_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Ensure all new and existing tests pass (`bundle exec rake spec`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
