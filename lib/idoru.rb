require 'singleton'
require 'forwardable'
require 'securerandom'

require 'base32'
require 'open-uri'
require 'rqrencoder'
require 'chunky_png'

require 'idoru/version'

require 'idoru/two_factor'
require 'idoru/encoder'
require 'idoru/qrcode'

require 'idoru/algorithm/otp'
require 'idoru/algorithm/totp'

require 'idoru/device/authenticator'
require 'idoru/device/google_authenticator'

module Idoru
  #
end

def Idoru issuer: issuer, uid: uid, secret: secret, length: 6, interval: 30,
  crypto: 'sha1'
  Idoru::TwoFactor.new(
      issuer: issuer,
         uid: uid,
      secret: secret,
      length: length,
    interval: interval,
      crypto: crypto
  )
end
