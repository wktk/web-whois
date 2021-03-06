# web-whois

Simple web interface for whois lookup

Simply displays output of [whois gem](https://github.com/weppos/whois) via HTTP.

## Environment variables

| Key | Value | Description |
|-----|-------|-------------|
| `ENFORCE_HTTPS` | true OR blank | Enforces HTTPS on Production or not |

## Deployment (on Heroku)

```sh
git clone git@github.com:wktk/web-whois.git
cd web-whois
heroku create
git push heroku master
```

## Deployment (local)

```sh
git clone git@github.com:wktk/web-whois.git
cd web-whois
bundle install
bundle exec rackup
```

## License

See `MIT-LICENSE`
