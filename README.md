# Idoru

A two-factor authentication library.

## Installation

Add this line to your application's Gemfile:

    gem 'idoru'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install idoru

## Prerequisite

This gem uses the [RQREncoder](https://github.com/mattyr/rqrencoder) library
to generate QR codes, so you will need to have `libqrencode` installed in your
system.

## Limitations

TOTP and Google Authenticator support only (for now).

## Usage

````ruby
require 'idoru'

# create and configure an Idoru::TwoFactor generator
phrase = 'Beauty is not caused. It is.'
idoru  = Idoru(issuer: 'Acme, Inc.', uid: 'emily@acme.com', secret: phrase)

# generate a QR code for 2FA registration and save to a PNG file
qrcode = idoru.qrcode
png    = qrcode.to_png
png.save(File.expand_path '~/Desktop/acme.png')

# compute 2FA code at current time to verify a registration or an auth challenge
idoru.authcode
````

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
