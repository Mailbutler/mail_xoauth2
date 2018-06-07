require 'helper'

class TestOauth2String < Test::Unit::TestCase
  def setup; end

  def test_build_oauth2_string
    user = 'somebody@gmail.com'
    oauth2_access_token = SecureRandom.urlsafe_base64

    oauth2_string = SomeNetClass.new.__send__('build_oauth2_string', user, oauth2_access_token)

    assert_equal(
      "user=#{user}\1auth=Bearer #{oauth2_access_token}\1\1",
      oauth2_string
    )
  end

  def test_build_encoded_oauth2_string
    user = 'somebody@gmail.com'
    oauth2_access_token = SecureRandom.urlsafe_base64

    oauth2_string = SomeNetClass.new.__send__('build_oauth2_string', user, oauth2_access_token, true)

    assert_equal(
        Base64.strict_encode64("user=#{user}\1auth=Bearer #{oauth2_access_token}\1\1"),
        oauth2_string
    )
  end
end

class SomeNetClass
  include MailXoauth2::Oauth2String
end
