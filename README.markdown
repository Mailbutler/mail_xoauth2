# mail_xoauth2 
Get access to IMAP and STMP via OAuth2, using the standard Ruby Net libraries.

This gem is based on and inspired by [gmail_xoauth](https://github.com/nfo/gmail_xoauth).

## Usage

### IMAP OAuth 2.0

```ruby
require 'mail_xoauth2'
imap = Net::IMAP.new('imap.gmail.com', 993, usessl = true, certs = nil, verify = false)
imap.authenticate('XOAUTH2', 'myemail@gmail.com', my_oauth2_token)
messages_count = imap.status('INBOX', ['MESSAGES'])['MESSAGES']
puts "Seeing #{messages_count} messages in INBOX"
```

### SMTP OAuth 2.0

```ruby
require 'mail_xoauth2'
smtp = Net::SMTP.new('smtp.gmail.com', 587)
smtp.enable_starttls_auto
smtp.start('gmail.com', 'myemail@gmail.com', my_oauth2_token, :xoauth2)
smtp.finish
```

## License

See LICENSE for details.
