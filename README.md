# todo-sinatra-datamapper
To-Do List App put together as a beginner Sinatra with Data Mapper example before mentoring at Codebar - Mind the Code

clone the repo and `cd` into it

Make sure you have Ruby installed https://www.ruby-lang.org/en/downloads/

```gem install bundler```

```
bundle install
```

Download and install [PostgreSQL](http://www.postgresql.org/download/)
Add a development database:

```bash
$ createdb development
```

Start the local server

```
rackup
```

Navigate to http://localhost:9292


To query/add stuff to the db using the command line (make sure you `cd` into the root directory:

```
pry
```

```
require './server'
```

```
Todo.all
```

```
Todo.create
```

```
Todo.get(1)
```

etc

More here http://cheat.errtheblog.com/s/datamapper
