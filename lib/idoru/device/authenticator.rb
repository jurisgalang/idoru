module Idoru
  module Device
    def self.Authenticator name, secret, issuer, uid, length = 6, interval = 30,
      crypto = 'sha1', type = 'totp'
      device = const_get(name)
      device.new(secret, issuer, uid, length, interval, crypto, type)
    end
  end
end
