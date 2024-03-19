# frozen_string_literal: true

if Gem::Version.new(Net::SMTP::VERSION) >= Gem::Version.new('0.4.0')
  # create xoauth2 class, until this https://github.com/ruby/net-smtp/pull/80/files lands in a new net-smtp version
  class Net::SMTP
    class AuthXoauth2 < Net::SMTP::Authenticator
      auth_type :xoauth2

      def auth(user, secret)
        token = xoauth2_string(user, secret)

        finish("AUTH XOAUTH2 #{base64_encode(token)}")
      end

      private

      def xoauth2_string(user, secret)
        "user=#{user}\1auth=Bearer #{secret}\1\1"
      end
    end
  end
else
  require 'net/smtp'
  require 'base64'

  module MailXoauth2
    module SmtpXoauth2Authenticator
      def send_xoauth2(auth_token)
        critical do
          get_response("AUTH XOAUTH2 #{auth_token}")
        end
      end
      private :send_xoauth2

      def get_final_status
        critical do
          get_response('')
        end
      end
      private :get_final_status

      def auth_xoauth2(user, oauth2_token)
        check_auth_args user, oauth2_token

        auth_string = build_oauth2_string(user, oauth2_token)
        res = send_xoauth2(base64_encode(auth_string))

        # See note about SMTP protocol exchange in https://developers.google.com/gmail/xoauth2_protocol
        res = get_final_status if res.continue?

        check_auth_response res
        res
      end

      include Oauth2String
    end
  end

  # Not pretty, right ?
  Net::SMTP.__send__('include', MailXoauth2::SmtpXoauth2Authenticator)
end