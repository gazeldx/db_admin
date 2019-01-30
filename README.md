## Ruby Database Admin
A gem based on [Sinatra](https://github.com/sinatra/sinatra) and [Sequel](https://github.com/jeremyevans/sequel).

You can use it to manage multiple databases at the same time.

Here are some demo pictures.

![Demo home](./lib/public/demo_home.png)

![Demo operations](./lib/public/demo_oprations.png)

![Demo hover](./lib/public/demo_hover.png)

## Installation
~~~bash
$ gem install db_admin
~~~
Or add `gem 'db_admin'` to your `Gemfile` and then run `$ bundle install`.
~~~ruby
group :development do 
  gem 'db_admin'
end
~~~

Make sure you have installed database driver gem.

E.g: `gem install pg`, `gem install sqlite3` or `gem install mysql2`, etc.

~~~bash
$ db_admin # Run this command to start a Sinatra Web.
~~~
Visit [http://localhost:4567](http://localhost:4567/)

## Contributing
Improving ruby-db-admin, please clone and pull requests! We love you do it.
