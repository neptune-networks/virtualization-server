APP_ROOT = Pathname.new(__FILE__) + '../../'
$LOAD_PATH.unshift(APP_ROOT)

require 'dotenv'
Dotenv.load

require 'bundler'
Bundler.require(:default, ENV.fetch('RACK_ENV'))

require 'libvirt'

paths = [
  Dir['app/*.rb'],
  Dir['app/**/*.rb'],
  Dir['config/initializers/**/*.rb'],
]

paths.map(&:sort).flatten.each { |path| require(path) }

require "config/environments/#{ENV.fetch('RACK_ENV')}.rb"
