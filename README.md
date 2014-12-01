## Ruby Database Admin
A Web database management system like phpmyadmin. It is written by Ruby.
Support many popular database like Postgersql, Mysql, Sqlite, Oracle, MSSql server, sqlanywhere, db2, Access and so on.

## Installation
    $ git@github.com:gazeldx/ruby-db-admin.git
    $ cd ruby-db-admin
    $ bundle install

modify the line 
    DB = Sequel.connect('postgres://user:password@host:port/database_name')
in `ruby db_admin.rb`. 

    $ ruby db_admin.rb
    
Then you can visit http://localhost:4567/ now!


## TODO
Add link to row columns which are integer to filter the related datas.(Like where)
Show caution if database is remote.