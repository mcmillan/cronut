# Cronut

<img align="right" width="150" src="https://upload.wikimedia.org/wikipedia/commons/9/99/Cronut.jpg">

Cronut is a tool for taking a cron expression (e.g. `* * * * * /bin/yes`) and outputting the times at which that cron expression will run. It supports most standard Vixie cron syntax, with some exceptions – see [known issues](#known-issues).

## Installation

1. Ensure you have Ruby 2.3 or higher installed
1. Run `gem install cronut`

## Usage

There are two ways to use Cronut:

### As a command-line tool

To use Cronut as a command-line tool and get human-readable representations of a cron expression, simply run:

```
cronut <your_cron_expression>
```

For example:

```
cronut '*/15 0 1,15 * 1-5 /usr/bin/find'
```

will output:

```
minute        0 15 30 45
hour          0
day of month  1 15
month         1 2 3 4 5 6 7 8 9 10 11 12
day of week   1 2 3 4 5
command       /usr/bin/find
```

### As a library

After you've required Cronut in your application (via `require 'cronut'` or your Gemfile), it can be used like so:

```ruby
expression = Cronut::Expression.new('* * * * * /bin/yes')
=> #<Cronut::Expression:0x007f975d06c8d0>

expression.weekday.possibilities
=> [0, 1, 2, 3, 4, 5, 6]

expression.command
=> "/bin/yes"
```

## Known Issues

The following (largely non-standard) features of some cron parsers are currently unsupported:

1. Shorthand macros (e.g. `@yearly`, `@monthly`, `@daily`)
1. Compositions of lists, ranges and steps (e.g. `1-2,3,*/4`)
1. Alternative single values for months (e.g. `JAN`, `DEC`)
1. Alternative single values for weekdays (e.g. `MON`, `SUN`)

## Development

To work on Cronut:

1. Clone this repository
1. Run `bundle install`
1. Run the tests using `rake`

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## Contribution Guidelines

Please note that this project is released with a [Contributor Code of Conduct](http://contributor-covenant.org/version/1/4/). By participating in this project you agree to abide by its terms.
