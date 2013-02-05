GoogleShortener is a Rubygem to create short url's using Google's URL shortener API (http://goo.gl/)
===============================================================================

-------------------------------------------------------------------------------
Installation:
-------------------------------------------------------------------------------

gem install google_shortener

-------------------------------------------------------------------------------
Usage:
-------------------------------------------------------------------------------
    irb(main):001:0> require 'google_shortener'
    => true

    irb(main):002:0> google_shortener = GoogleShortener.new
    => #<GoogleShortener:0x000000025a8ca8 @api_key="AIzaSyDOY31us5qGR_MdMQKaTfGlhpOi8w3Ur7U">

    irb(main):003:0> google_shortener.shorten('http://www.google.com/')
    => "http://goo.gl/fbsS"

    irb(main):004:0> google_shortener.expand("http://goo.gl/fbsS")
    => "http://www.google.com/"

  By default, the above object contains a Google URL shortener API key, you
  may want to use your own API key for analytics purposes. Refer to
  https://developers.google.com/url-shortener/ .

    irb(main):005:0> google_shortener.api_key='your own API key'
    => "your own API key"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
