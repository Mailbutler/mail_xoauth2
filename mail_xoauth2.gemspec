lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)
require 'mail_xoauth2/version'

Gem::Specification.new do |s|
  s.name        = 'mail_xoauth2'
  s.version     = MailXoauth2::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Fabian Jäger']
  s.email       = ['fabian@mailbutler.io']
  s.homepage    = 'https://github.com/Mailbutler/mail_xoauth2'
  s.summary     = %(Get access to IMAP and STMP via OAuth2, using the standard Ruby Net libraries)
  s.description = %(Get access to IMAP and STMP via OAuth2, using the standard Ruby Net libraries)

  s.required_rubygems_version = '>= 1.3.6'

  s.add_development_dependency 'mocha', '>= 0'
  s.add_development_dependency 'shoulda', '>= 0'

  s.files = Dir.glob('{bin,lib,test}/**/*') + %w[LICENSE README.markdown]
  s.files.reject! { |fn| fn.include? 'valid_credentials.yml' }

  s.require_path = 'lib'

  s.rdoc_options = ['--charset=UTF-8']
end
