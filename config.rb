config_env :development do
  set 'URL', 'redis://127.0.0.1:6379/1'
  set 'NAMESPACE', 'hello'
  set 'USERNAME', 'admin'
  set 'PASSWORD', '123456'
end

config_env :production do
  set 'URL', 'redis://@127.0.0.1:6379/1'
  set 'NAMESPACE', 'world'
  set 'USERNAME', 'admin'
  set 'PASSWORD', '123456'
end
