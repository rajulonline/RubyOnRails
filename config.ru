# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

# config.ru
# require 'rack/protection'
# 
# use Rack::Protection::AuthenticityToken
# use Rack::Protection::HttpOrigin
# use Rack::Protection::FrameOptions
# use Rack::Protection::EscapedParams
run Learning::Application
