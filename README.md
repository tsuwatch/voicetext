# Voicetext

voicetext API Ruby Client

## Installation

Add this line to your application's Gemfile:

    gem 'voicetext'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install voicetext

## Usage

```ruby
require 'voicetext'

voicetext = Voicetext.new('YOUR_API_KEY')

wav = voicetext.tts('にっこにっこにー', 'show')

wav = voicetext.tts('にっこにっこにー', 'show', { :emotion => 'happiness' })
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/voicetext/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
