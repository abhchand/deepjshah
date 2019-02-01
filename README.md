Create database

```
psql
create database deepjshah
```
Also ensure the `DATABASE_URL` environment variable is set to the connection URL for the database created above.

Bundle and Migrate

```
bundle install
rake db:migrate
```

Run

```
bundle exec rackup -p4567 --host 0.0.0.0
```

Visit http://http://localhost:4567/
