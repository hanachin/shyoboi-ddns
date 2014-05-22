shyoboi-ddns
============
Cheap Dynamic DNS Server.

- - -

しょぼいDDNSサーバです。

## Usage

```
$ git clone git@github.com:hanachin/shyoboi-ddns.git
$ heroku create yourapp
$ git push heroku
$ heroku config:add AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY_ID
$ heroku config:add AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY
$ heroku config:add HOSTED_ZONE_ID=YOUR_ROUTE53_HOSTED_ZONE_ID
$ heroku config:add SHYOBOI_DOMAIN=YOUR_FQN_DOMAIN_NAME
```

Then add `curl http://yourapp.herokuapp.com` to crontab.
