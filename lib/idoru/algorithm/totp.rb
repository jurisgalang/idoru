module Idoru
  module Algorithm
    class TOTP
      def initialize secret, length = 6, interval = 30, crypto = 'sha1'
        @secret   = secret
        @length   = length
        @interval = interval
        @crypto   = crypto.upcase
      end

      # Computes the one-time password code for the given point in time.
      # Raises ArgumentError if time is not UTC
      def at time = Time.now.utc
        fail ArgumentError, 'Expected time to be in UTC' unless time.utc?
        sprintf("%0.#{@length}d", otp(step time))
      end

      alias_method :generate, :at

      private

      def otp at
        msg    = [at].pack('Q>')
        digest = OpenSSL::HMAC.digest(@crypto, @secret, msg)
        offset = digest[19].ord & 0xf
        bytes  = digest[offset .. offset + 3].unpack('I>')
        (bytes[0] & 0x7fffffff) % (10**@length)
      end

      def step time
        time.to_i / @interval
      end
    end
  end
end
