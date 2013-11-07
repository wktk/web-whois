require 'haml'
require 'simpleidn'
require 'sinatra'
require 'whois'

helpers do
  def lookup(domain)
    Whois.query(idn_encode(domain))
  rescue Whois::Error => e
    e.message
  rescue
    'Error!'
  end

  def idn_encode(domain)
    SimpleIDN.to_ascii(domain)
  end
end

get '/' do
  haml :index
end

get '/lookup' do
  redirect to "/#{URI.escape(params['domain'])}"
end

get '/*' do |domain|
  redirect to(domain.gsub(%r[/.*], '')) if domain.include?('/')
  result = lookup(domain)
  haml :result, locals: { result: result, domain: domain }
end
