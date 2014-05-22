# encoding: utf-8
$LOAD_PATH.push File.expand_path('lib', File.dirname(__FILE__))

Gem::Specification.new do |s|
  s.name        = 'shyoboi-ddns'
  s.version     = '0.0.1'
  s.licenses    = ['MIT']
  s.summary     = "Simple DDNS Server"
  s.authors     = ["Seiei Higa"]
  s.email       = 'hanachin@gmail.com'
  s.files       = Dir["{bin,lib}/**/*"] + ['LICENSE', 'README.md', 'config.ru']

  s.required_ruby_version = '~> 2.1.2'
  s.add_dependency 'sinatra'
  s.add_dependency 'aws-sdk'
end
