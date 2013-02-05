require 'minitest/autorun'
require 'minitest/pride'
require 'google_shortener'

class GoogleShortenerTest < MiniTest::Unit::TestCase
  def test_default_api_key
    google_shortener = GoogleShortener.new
    assert 'AIzaSyDOY31us5qGR_MdMQKaTfGlhpOi8w3Ur7U', google_shortener.api_key
  end

  def test_valid_api_key_with_correct_key
    google_shortener = GoogleShortener.new
    google_shortener.api_key = 'AIzaSyDOY31us5qGR_MdMQKaTfGlhpOi8w3Ur7U'
    assert google_shortener.valid_api_key?
  end

  def test_valid_api_key_with_incorrect_key
    google_shortener = GoogleShortener.new
    google_shortener.api_key = 'foo'
    assert google_shortener.valid_api_key?
  end

  def test_shorten_with_long_url
    google_shortener = GoogleShortener.new
    assert_equal 'http://goo.gl/fbsS', google_shortener.shorten('http://www.google.com/')
  end

  def test_shorten_with_no_long_url
    google_shortener = GoogleShortener.new
    assert_raises ArgumentError do
      google_shortener.shorten
    end
  end

  def test_expand_with_short_url
    google_shortener = GoogleShortener.new
    assert_equal 'http://www.google.com/', google_shortener.expand('http://goo.gl/fbsS')
  end

  def test_expand_with_no_short_url
    google_shortener = GoogleShortener.new
    assert_raises ArgumentError do
      google_shortener.expand
    end

  end
end
