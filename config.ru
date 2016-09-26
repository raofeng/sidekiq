require 'sidekiq'
require 'sidekiq/web'
require 'config_env'

ConfigEnv.path_to_config("#{__dir__}/config.rb")

Sidekiq.configure_client do |config|
  config.redis = {
    url:       ENV['URL'],
    namespace: ENV['NAMESPACE'],
    size:      1
  }
end

map '/' do
  use Rack::Auth::Basic, 'User Login' do |username, password|
    username == ENV['USERNAME'] && password == ENV['PASSWORD']
  end

  run Sidekiq::Web
end