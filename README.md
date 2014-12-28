## Ruby Database Admin
A Sequel and Sinatra project. [Demo](http://ruby-db-admin.coding.io/)

## Installation
~~~
$ git@github.com:gazeldx/ruby-db-admin.git
$ cd ruby-db-admin
~~~

You should installed your database driver gem first. For example, if you use Postgresql you need `$ gem install pg` or put `gem 'pg'` to Gemfile.
~~~
$ bundle install
~~~

Follow [Sequel#getting-started](https://github.com/jeremyevans/sequel#getting-started), modify the line `DB = Sequel.connect('postgres://user:password@host:port/database_name')` in `ruby db_admin.rb`. 
~~~
$ ruby db_admin.rb
~~~
Then you can visit [http://localhost:4567/](http://localhost:4567/) now!

## Contributing

If you'd like to help improve ruby-db-admin, clone and pull requests! We love you do it.

## License

ruby-db-admin is released under the [MIT license](http://www.opensource.org/licenses/MIT).

## TODOs
Please look at [WIKI](https://github.com/gazeldx/ruby-db-admin/wiki)