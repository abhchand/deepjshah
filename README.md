Create database

```
psql
create database deepjshah
```

Bundle and Migrate

```
bundle install
DATABASE_URL=... rake db:migrate
```

Run

```
DATABASE_URL=... bundle exec rackup -p4567 --host 0.0.0.0
```

Visit http://http://localhost:4567/
