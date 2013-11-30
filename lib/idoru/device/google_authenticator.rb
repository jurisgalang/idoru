module Idoru
  module Device
    class GoogleAuthenticator
      def initialize secret, issuer, uid, length = 6, interval = 30,
        crypto = 'sha1', type = 'totp'
        @secret   = Base32::encode(secret).gsub(/\=/, '')
        @issuer   = issuer
        @uid      = uid
        @length   = length
        @interval = interval
        @crypto   = crypto
        @type     = type.downcase
      end

      def generate
        QRCode.new(Encoder.instance.encode key)
      end

      private

      def key
        URI::encode "otpauth://#{@type}/#{label}?#{params}"
      end

      def label
        "#{@issuer}:#{@uid}"
      end

      def params
        hash = {
          :secret    => @secret,
          :issuer    => @issuer,
          :algorithm => @crypto,
          :digits    => @length,
          :period    => @interval
        }
        hash.map{ |k, v| "#{k}=#{v}" }.join('&')
      end
    end
  end
end
