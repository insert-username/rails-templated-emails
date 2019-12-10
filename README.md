# Notes for development

## Ubuntu

_Note: sqlite3 is used locally to make it easier to directly check out this repo and start playing with it. In practice,
it would be better to use postgresql locally, or configure the heroku environment to support sqlite3._

### Postgresql setup
This section is to document how to set up postgresql locally, for example if development is changed to use it in future.
You should not need to do any of this if you just want to check out the repo and play with it.

If ```gem install 'pg'``` fails, try the following first.
```
sudo apt-get -y install postgresql postgresql-contrib libpq-dev

sudo -u postgres psql
\password postgres
create role rails_dev with createdb login password 'password'

export DATABASE_URL="url of local database"
export MYAPP_DATABASE_PASSWORD="password for database"
```

You may have to follow:
```https://gist.github.com/AtulKsol/4470d377b448e56468baef85af7fd614```

Because rails wants to remove foreign key constraints during
testing, you may have to give it superuser privileges.

```postgres=# ALTER USER rails_dev WITH SUPERUSER;```

You will also need to update your Rubymine run configurations accordingly. For reference, to run postgres locally
(for running tests) I am using the following environment variables:
```RAILS_ENV=test;JRUBY_OPTS=-X+O;MYAPP_DATABASE_PASSWORD=password;SENDGRID_USERNAME=sendgrid-username```

(note that a SENDGRID_USERNAME environment variable is required during development, however sendgrid will not actually 
be used as sending emails is disabled by default in development).

## Deployment
How to setup for deployment and push to heroku.

See: ```https://devcenter.heroku.com/articles/getting-started-with-rails6```

once those instructions are followed, use:

```git push heroku master```
```heroku run rake db:migrate```
```heroku run rake db:seed```
