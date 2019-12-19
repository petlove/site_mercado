# frozen_literal_string: true

module SiteMercado
  module Entities
    class Base
      def initialize(params, attrs, dictionary)
        attrs.each do |attr|
          translated = dictionary.key(attr)
          value = params.send(translated) if translated
          instance_variable_set("@#{attr}", value) if value
        end
      end
    end
  end
end
