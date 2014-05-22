require 'sinatra/base'

class ShyoboiDdns < Sinatra::Base
  require 'shyoboi-ddns/providers'

  get '/' do
    provider.update(domain, request.ip)
  end

  private
  def provider
    ShyoboiDdns::Providers::Route53.new(hosted_zone_id)
  end

  def domain
    @domain ||= ENV['SHYOBOI_DOMAIN']
  end

  def hosted_zone_id
    @hosted_zone_id ||= ENV['HOSTED_ZONE_ID']
  end
end
