# The juice that over-rides element and collection path setting the seperator to nil if the extension is blank
module ExtensionlessFormat
  module ActiveResourceSeperatorStripper
    def self.included(base)
      base.class_eval do
        class << self
          def element_path_with_extension_hack(id, prefix_options = {}, query_options = nil)
            prefix_options, query_options = split_options(prefix_options) if query_options.nil?
            seperator = format.extension.blank? ? "" : "."
            "#{prefix(prefix_options)}#{collection_name}/#{id}#{seperator}#{format.extension}#{query_string(query_options)}"
          end
          def collection_path_with_extension_hack(prefix_options = {}, query_options = nil)
            prefix_options, query_options = split_options(prefix_options) if query_options.nil?
            seperator = format.extension.blank? ? "" : "."
            "#{prefix(prefix_options)}#{collection_name}#{seperator}#{format.extension}#{query_string(query_options)}"
          end
          alias_method_chain :element_path, :extension_hack
          alias_method_chain :collection_path, :extension_hack
        end
      end
    end
  end
end
