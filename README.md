## Ruby Database Admin
A gem based on [Sinatra](https://github.com/sinatra/sinatra) and [Sequel](https://github.com/jeremyevans/sequel).
You can use it to manage multiple databases at the same time.

Rails user can also use it because it is just a gem. Here are some demo pictures.

![Demo home](./lib/public/demo_home.png)

![Demo operations](./lib/public/demo_operations.png)

![Demo hover](./lib/public/demo_hover.png)

## Installation
**The best way to use this gem is `gem install db_admin`**.

If you prefer to use it in `Gemfile`:
~~~ruby
group :development do
  # A Web UI for database admin. Run `$ db_admin` and then
  # visit http://localhost:4567
  gem 'db_admin', require: false # Don't require the code because you needn't it.
end
~~~

Make sure you have installed database driver gem.

E.g: `gem install pg`, `gem install sqlite3` or `gem install mysql2`, etc.

~~~bash
$ db_admin # Run this command to start a Sinatra Web.
~~~
Visit [http://localhost:4567](http://localhost:4567/)

## Customizing
If you want to change some code for your own purpose, please
~~~bash
$ git clone git@github.com:gazeldx/db_admin.git
$ cd db_admin
$ ruby lib/db_admin/run_web.rb # Then visit http://localhost:4567 
~~~

### Debugging
You need to restart Web when you made a change. 

Uncomment the below line in `./lib/db_admin.rb` to auto-reload changed files.
~~~ruby
require 'sinatra/reloader' if development? # `$ gem install sinatra-reloader` first. 
~~~
