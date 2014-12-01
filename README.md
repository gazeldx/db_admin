## Ruby Database Admin
A Sequel and Sinatra project.

## Installation
    $ git@github.com:gazeldx/ruby-db-admin.git
    $ cd ruby-db-admin
    $ bundle install

Follow [Sequel#getting-started](https://github.com/jeremyevans/sequel#getting-started), modify the line `DB = Sequel.connect('postgres://user:password@host:port/database_name')` in `ruby db_admin.rb`. 

    $ ruby db_admin.rb
    
Then you can visit [http://localhost:4567/](http://localhost:4567/) now!

Feel free to give me suggestion and report bugs.

## TODOs
0 Edit or delete each line.

1 Add link to row columns which are integer to filter the related datas.(Like where)

2 Show caution if database is remote.