require 'helper'

class TestOauth2String < Test::Unit::TestCase
  def setup; end

  def test_build_oauth2_string
    OAuth::Helper.stubs(:generate_key).returns('abc')
    OAuth::Helper.stubs(:generate_timestamp).returns(1_274_215_474)

    user = 'somebody@gmail.com'
    oauth2_access_token = SecureRandom.urlsafe_base64

    oauth2_string = C.new.__send__('build_oauth2_string', user, oauth2_access_token)

    assert_equal(
      "user=#{user}\1auth=Bearer #{oauth2_access_token}\1\1",
      oauth2_string
    )
  end
end

class C
  include MailXoauth2::Oauth2String
end
