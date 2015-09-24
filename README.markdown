# This gem is no longer in development. I highly recommend using other
alternatives
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

    Analytics can be obtained for the short URL, to obtain detail
    information set projection to 'FULL'. Other values for projection are
    'ANALYTICS_CLICKS', 'ANALYTICS_TOP_STRINGS'

    irb(main):006:0> google_shortener.analytics(google_shortener.shorten('http://www.twitter.com'), 'ANALYTICS_CLICKS')
    => {
    "kind"=>"urlshortener#url",
    "id"=>"http://goo.gl/CbHS",
    "longUrl"=>"http://www.twitter.com/",
    "status"=>"OK",
    "analytics"=>{
    "allTime"=>{
    "shortUrlClicks"=>"655",
    "longUrlClicks"=>"4515"
    },
    "month"=>{
    "shortUrlClicks"=>"17",
    "longUrlClicks"=>"50"
    },
    "week"=>{
    "shortUrlClicks"=>"2",
    "longUrlClicks"=>"12"
    },
    "day"=>{
    "shortUrlClicks"=>"0",
    "longUrlClicks"=>"5"},
    "twoHours"=>{
    "shortUrlClicks"=>"0",
    "longUrlClicks"=>"0"
    }}}


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
