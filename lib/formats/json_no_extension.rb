module ActiveResource
  module Formats
    module JsonNoExtensionFormat
      extend self

      def extension
        ""
      end

      def mime_type
        "application/json"
      end

      def encode(hash, options = nil)
        ActiveSupport::JSON.encode(hash, options)
      end

      def decode(json)
        ActiveSupport::JSON.decode(json)
      end
    end
  end
end                          
