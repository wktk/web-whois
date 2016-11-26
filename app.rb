require 'rack/ssl-enforcer'
require 'simpleidn'
require 'sinatra'
require 'slim'
require 'whois'
require_relative 'helpers'

helpers { prepend Helpers }

configure :production do
  use Rack::SslEnforcer if ENV['ENFORCE_HTTPS']
end

get '/' do
  slim :index
end

get '/lookup' do
  redirect to "/#{URI.escape(params['domain'])}"
end

get '/*' do |domain|
  redirect to(domain.gsub(%r[/.*], '')) if domain.include?('/')
  result = lookup(domain)
  slim :result, locals: { result: result, domain: domain }
end
