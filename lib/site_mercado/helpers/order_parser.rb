# frozen_string_literal: true

module SiteMercado
  module Helpers
    class OrderParser
      class << self
        def encode_id(id)
          time, code = id.split('-')
          ascii = code[0].ord
          "#{time}#{ascii}#{code[1..]}"
        end

        def decode_id(id)
          time = id[0..3]
          ascii = id[4..5]
          code = id[6..]

          "#{time}-#{ascii.to_i.chr}#{code}"
        end
      end
    end
  end
end
