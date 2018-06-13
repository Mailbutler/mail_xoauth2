module MailXoauth2
  module Oauth2String
    private

    #
    # Builds the "oauth2 protocol authentication string". See https://developers.google.com/google-apps/gmail/xoauth2_protocol
    #
    #   +user+ is an email address: roger@gmail.com
    #   +oauth2_token+ is the oauth2 token
    def build_oauth2_string(user, oauth2_token)
      format("user=%<user>s\1auth=Bearer %<token>s\1\1".encode('us-ascii'), user: user, token: oauth2_token)
    end
  end
end
