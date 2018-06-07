require 'net/imap'

module MailXoauth2
  class ImapXoauth2Authenticator
    def process(_data)
      build_oauth2_string(@user, @oauth2_token)
    end

    private

    # +user+ is an email address: roger@gmail.com
    # +oauth2_token+ is the OAuth2 token
    def initialize(user, oauth2_token)
      @user = user
      @oauth2_token = oauth2_token
    end

    include Oauth2String
  end
end

Net::IMAP.add_authenticator('XOAUTH2', MailXoauth2::ImapXoauth2Authenticator)
