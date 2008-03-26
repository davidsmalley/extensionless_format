require 'extensionless_format'
Dir.glob(File.join(File.dirname(__FILE__), 'lib/formats/*.rb')).each {|f| require f }

ActiveResource::Base.send(:include, ExtensionlessFormat::ActiveResourceSeperatorStripper)