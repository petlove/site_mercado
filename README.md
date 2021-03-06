[![Maintainability](https://api.codeclimate.com/v1/badges/3f066fe89aa7ba5fa117/maintainability)](https://codeclimate.com/github/petlove/site_mercado/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/3f066fe89aa7ba5fa117/test_coverage)](https://codeclimate.com/github/petlove/site_mercado/test_coverage)

# SiteMercado

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/site_mercado`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'site_mercado'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install site_mercado

## Usage

Configfile

```ruby
SiteMercado.config do |config|
  config.client_id = '<CLIENT_ID>'
  config.client_secret = '<CLIENT_SECRET>'
  config.endpoing = '<ENDPOINT>'
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

If you're implementing any new request test using VCR, make sure that you set the following environment variables with a valid value to request
```
 SITEMERCADO_CLIENT_ID
 SITEMERCADO_CLIENT_SECRET
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/site_mercado. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SiteMercado project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/site_mercado/blob/master/CODE_OF_CONDUCT.md).
