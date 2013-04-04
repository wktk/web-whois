require 'haml'
require 'sinatra'
require 'whois'

get '/' do
  haml :index
end

get '/*' do |domain|
  result = Whois::Client.new.lookup(domain) rescue 'Error!'
  haml :result, locals: { result: result, domain: domain }
end
