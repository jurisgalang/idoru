# Idoru

A two-factor authentication library.

This library provides the primitives to support a two-factor authentication feature.

## Installation

Add this line to your application's Gemfile:

    gem 'idoru'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install idoru

## Dependencies

This gem uses the [RQREncoder](https://github.com/mattyr/rqrencoder) library
to generate QR codes, so you will need to have `libqrencode` installed in your
system.

The easiest way to install it (if you're on OS X) is to use [Homebrew](http://brew.sh/):

````sh
$ brew install libqrencode
````

## Usage

````ruby
require 'idoru'

# generate a shared secret for 2FA
secret = Idoru::TwoFactor.key

# create and configure an Idoru::TwoFactor generator
idoru  = Idoru(issuer: 'Acme, Inc.', uid: 'emily@acme.com', secret: secret)

# generate a QR code for 2FA registration and save to a PNG file
qrcode = idoru.qrcode
png    = qrcode.to_png
png.save(File.expand_path '~/Desktop/acme.png')

# print the 2FA code at current time to verify registration or auth challenge
puts idoru.authcode

# generate backup verification codes from random points in time
10.times do
  time = Time.at(Time.now + rand * Time.now.to_f).utc
  puts idoru.authcode(time)
end
````


## Features

* TOTP code generation using various algorithms (SHA1, SHA256, SHA512, etc),
code lengths, and step-times.

* Helper for generating matching QR code for registration.

## Limitations

At the moment, support is limited to the Google Authenticator and TOTP code
generation only.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
