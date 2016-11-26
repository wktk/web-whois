module Helpers
  def lookup(domain)
    Whois.whois(idn_encode(domain))
  rescue Whois::Error => e
    e.message
  rescue
    'Error!'
  end

  def idn_encode(domain)
    SimpleIDN.to_ascii(domain)
  end
end
