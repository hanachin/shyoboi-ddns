require 'aws-sdk'

class ShyoboiDdns::Providers::Route53
  attr_accessor :access_key_id, :secret_access_key

  def access_key_id
    @access_key_id ||= ENV['AWS_ACCESS_KEY_ID']
  end

  def secret_access_key
    @secret_access_key ||= ENV['AWS_SECRET_ACCESS_KEY']
  end

  def initialize(hosted_zone_id)
    @hosted_zone_id = hosted_zone_id
  end

  def update(domain, ip)
    r53.client.change_resource_record_sets(
      hosted_zone_id: @hosted_zone_id,
      change_batch: {changes: [change(domain, ip)]}
    )
  end

  private
  def r53
    @r53 ||= AWS::Route53.new(
      access_key_id:     access_key_id,
      secret_access_key: secret_access_key
    )
  end

  def action
    'UPSERT'
  end

  def ttl
    360
  end

  def type
    'A'
  end

  def change(domain, ip)
    {
      action: action,
      resource_record_set: {
        name: domain,
        type: type,
        ttl:  ttl,
        resource_records: [
          {value: ip}
        ]
      }
    }
  end
end
