Create database

```
psql
create database deepjshah
```

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
