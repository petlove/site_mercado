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

          result = "#{time}-#{ascii.to_i.chr}#{code}"

          return result if result.size <= 14

          "#{id[0..4]}-#{id[5..6].to_i.chr}#{id[7..]}"
        end
      end
    end
  end
end
