# Russh

**Russh =** Ruby + SSH . SSH Config Manager for Ruby. It helps you manage your SSH configuration.

You can create, delete and update your existing configuration.

Currently under heavy development.

## Installation

    $ gem install russh

## Usage

### Create a new configuration

    russh create --alias host1 --host www.example.com --username ubuntu

### Backup

    russh backup

## Contributing

1. Fork it ( https://github.com/[my-github-username]/russh/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
