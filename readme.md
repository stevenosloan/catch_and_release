Tools for testing with `$stdin`, `$stdout`, and `$stderr`.

[![Build Status](https://travis-ci.org/stevenosloan/catch_and_release.png?branch=master)](https://travis-ci.org/stevenosloan/catch_and_release) [![Code Climate](https://codeclimate.com/github/stevenosloan/catch_and_release.png)](https://codeclimate.com/github/stevenosloan/catch_and_release)


## Use

### Stderr & Stdout

By running code in a block passed to `Catch::stdout` or `Catch::stderr`, any output passed to the associated output stream will be returned.

```ruby
require 'catch_and_release'

out = CatchAndRelease::Catch.stdout do
  print 'hello world'
end

out
# => "hello world"
```

```ruby
require 'catch_and_release'

err = CatchAndRelease::Catch.stderr do
  $stderr.print 'hello world'
end

err
# => 'hello world'
```


### Stdin

The `Release::stdin` will replay the passed arguments to stdin. To test code with a specific input, run it inside a block passed to `::stdin`.

```ruby
require 'catch_and_release'

CatchAndRelease::Release.stdin 'hello', 'world' do
  $stdin.gets.chomp
  # => 'hello'

  $stdin.gets.chomp
  # => 'world'
end
```


### With Rspec

You can shortcut the class definitions to `Catch.stdout`, `Release.stdin` by including the `CatchAndRelease` module in rspec config.

```ruby
# spec/spec_helper.rb
require 'catch_and_release'

RSpec.configure do |config|
  config.include CatchAndRelease
end
```


## Testing

```bash
$ rspec
```


## Contributing

If there is any thing you'd like to contribute or fix, please:

- Fork the repo
- Add tests for any new functionality
- Make your changes
- Verify all new &existing tests pass
- Make a pull request


## License

The catch_and_release gem is distributed under the MIT License.