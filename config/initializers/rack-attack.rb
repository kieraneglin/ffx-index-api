class Rack::Attack
  whitelist('allow from localhost') do |req|
    '127.0.0.1' == req.ip || '::1' == req.ip
  end

  throttle('req/ip', limit: 5, period: 3.seconds) do |req|
    req.ip
  end
  
  # blacklist('disallow all except my hosts') do |req|
  #   req.host != 'localhost' && req.host != 'ffxindex.com'
  # end

  Rack::Attack.blacklisted_response = lambda do |env|
    body = {
      status: 503,
      data: "service_unavailable"
    }.to_json

    [ 503, {}, [body]]
  end
end
