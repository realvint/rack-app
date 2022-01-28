require_relative 'app'
ROUTES = { '/time' => App.new }.freeze

use Rack::Reloader
use Rack::ContentType, 'text/plain'
run Rack::URLMap.new(ROUTES)
