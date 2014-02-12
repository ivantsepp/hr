# Hr

A `<hr />` tag for your terminal


Use hr to delimit your output for a better separation visually.
This small project was inspired by the [bash `hr` script](https://github.com/LuRsT/hr)
created by [@LuRsT](https://github.com/LuRsT)

## Installation

Add this line to your application's Gemfile:

    gem 'hr'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hr

## Usage

You can use `hr` by itself:

```
~$ hr =
====================================== # ... to the end of your terminal window
~$ hr -
-------------------------------------- # ... to the end of your terminal window
~$ hr = - .
====================================== # ... to the end of your terminal window
-------------------------------------- # ... to the end of your terminal window
...................................... # ... to the end of your terminal window
```

You can use it in your projects:

```
[1] pry(main)> Hr.print "="
====================================== # ... to the end of your terminal window
```

`hr` uses the `colorize` gem so you can pass options to color your output.
Also, use `string` method to get the string itself.

```
[1] pry(main)> Hr.string "=", :color => :red, :background => :green, :mode => :bold
=> "\e[1;31;42m=================================\e[0m"
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
