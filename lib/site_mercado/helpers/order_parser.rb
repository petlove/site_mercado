module SiteMercado
  module Helpers
    class OrderParser
      class << self
        def encode_id(id)
          time = id.split('-')[0]
          code = id.split('-')[1]
          ascii = code[0].ord
          "#{time}#{ascii}#{code[1..]}"
        end

        def decode_id(id)
          time = id[0..9]
          ascii = id[10..11]
          code = id[12..]
          "#{time}-#{ascii.to_i.chr}#{code}"
        end
      end
    end
  end
end
