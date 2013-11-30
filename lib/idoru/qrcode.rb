module Idoru
  class QRCode
    BLACK = ::ChunkyPNG::Color::BLACK
    WHITE = ::ChunkyPNG::Color::WHITE

    def initialize content
      @content = content
    end

    def to_png size = 800
      create_image(@content.length + 2).tap do |image|
        scan{ |bit, x, y| image[x + 1, y + 1] = BLACK if bit }
      end.resize(size, size)
    end

    def self.encoder

    end

    private

    def create_image size, background = WHITE
      ChunkyPNG::Image.new(size, size, background)
    end

    def scan
      @content.each_with_index do |bits, y|
        bits.each_with_index do |bit, x|
          yield bit, x, y if block_given?
        end
      end
    end
  end
end
