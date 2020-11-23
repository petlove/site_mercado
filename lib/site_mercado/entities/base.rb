# frozen_string_literal: true

module SiteMercado
  module Entities
    class Base
      def initialize(params, attrs, dictionary)
        attrs.each do |attr|
          translated = dictionary.key(attr)
          value = params[translated.to_s] if translated
          instance_variable_set("@#{attr}", value) if value
        end
      end

      def attributes
        attrs = {}

        instance_variables.each do |attribute|
          attrs[attribute[1..].to_sym] = instance_variable_get(attribute)
        end

        attrs
      end
    end
  end
end
