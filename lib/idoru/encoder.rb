module Idoru
  class Encoder
    include Singleton

    def initialize
      @encoder = RQREncoder::QREncoder.new
    end

    def encode key
      @encoder.encode(key).modules
    end
  end
end