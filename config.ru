require './config/environment'

use Rack::MethodOverride
use DestinationsController
run ApplicationController
