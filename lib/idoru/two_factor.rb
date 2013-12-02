module Idoru
  class TwoFactor
    class << self
      extend Forwardable
      def_delegator SecureRandom, :hex, :key
    end
  end

  class TwoFactor
    def initialize uid: required, issuer: required, secret: required,
      length: 6, interval: 30, crypto: 'sha1'
      @uid      = uid
      @issuer   = issuer
      @secret   = secret
      @length   = length
      @interval = interval
      @crypto   = crypto.upcase
    end

    def authcode time = Time.now.utc
      otp.at time
    end

    def qrcode
      device.generate
    end

    private

    def otp
      @otp ||= Algorithm::OTP('TOTP', @secret, @length, @interval, @crypto)
    end

    def device
      @device ||= Device::Authenticator('GoogleAuthenticator', @secret, @issuer,
        @uid, @length, @interval, @crypto, 'TOTP')
    end

    # keep until Ruby 2.1 comes out :-)
    def required
      method = caller_locations(1, 1)[0].label
      fail ArgumentError, "required argument missing for #{method}"
    end
  end
end
