# web-whois

Pretty simple web interface for whois lookups.

Simply displays output of [whois gem](https://github.com/weppos/whois).

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
