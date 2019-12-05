# Notes for development

## Ubuntu

If ```gem install 'pg'``` fails, try the following first.
```
sudo apt-get -y install postgresql postgresql-contrib libpq-dev
```

```
sudo -u postgres psql
\password postgres
create role rails_dev with createdb login password 'password'


export DATABASE_URL="url of local database"
export MYAPP_DATABASE_PASSWORD="password for database"

You may have to follow:
https://gist.github.com/AtulKsol/4470d377b448e56468baef85af7fd614

Because rails wants to remove foreign key constraints during
testing, you may have to give it superuser privileges.

postgres=# ALTER USER rails_dev WITH SUPERUSER;

You will also need to update your Rubymine run configurations accordingly.

```

## Deployment

See: https://devcenter.heroku.com/articles/getting-started-with-rails6