require 'verb'

use Verb

run Rack::File.new("public")
