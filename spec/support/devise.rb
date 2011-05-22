RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include ControllerMacros, :type => :controller
end
