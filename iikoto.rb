require 'sinatra'
require 'sinatra/flash'
require 'rack/csrf'
require 'active_record'
require 'yaml'
require 'sass/plugin/rack'

require_relative 'models/master'
require_relative 'core_ext'

# Read the config file.
begin
  $CONFIG = YAML.load_file('config.yml').freeze
  $ROOT = File.dirname(__FILE__)

  # An assertion function for fields in the config.
  def assert_config(field)
    unless $CONFIG.key?(field)
      raise "The config file is missing #{field}" unless $CONFIG.key?(field)
    end
  end

  assert_config(:connection)
  assert_config(:max_filesize)
  assert_config(:reply_limit)
  assert_config(:image_limit)
  assert_config(:default_name)
  assert_config(:url_hash_size)
rescue Exception => e
  puts e
  puts "The config file 'config.yml' is missing."
  exit 1
end

# Establish ActiveRecord's base connection.
ActiveRecord::Base.establish_connection($CONFIG[:connection])

class Imageboard < Sinatra::Base
  # Enable Rack CSRF protection and flashes.
  register Sinatra::Flash
  set :public_folder, File.dirname(__FILE__) + '/public'

  Sass::Plugin.options[:style] = :compressed
  use Sass::Plugin::Rack
  configure do
    use Rack::Session::Cookie, secret: $CONFIG[:secret]
    use Rack::Csrf, raise: true
  end

  require_relative 'routes/main'
end
