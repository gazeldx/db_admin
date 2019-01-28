# This file is used for inserting some sample data into a testing database.
# Please connect to your testing database first.
# You can uncomment the line `DB = Sequel.connect`,
# then run `ruby seeds.rb` to generate sample data.

require 'sequel'

# Connect SQLite DB located at './sqlite_example.db'.
# DB = Sequel.sqlite('sqlite_example.db')

# Connect PostgreSQL DB.
# DB = Sequel.connect({ adapter: 'postgres',
#                       host: 'hostname_or_ip',
#                       database: 'database_name',
#                       user: 'user',
#                       password: '',
#                       port: 5432 })

# Connect other DBs.
# 'adapter' can also be 'mysql2', 'postgres', 'sqlite', 'oracle', 'sqlanywhere', 'db2', 'informix', etc.
# We will use default port if port is nil.
# DB = Sequel.connect({ adapter: 'mysql2',
#                       host: 'hostname_or_ip',
#                       database: 'database_name',
#                       user: 'user',
#                       password: '' })
#
rubyist_count = 12
programmers_count = 50
(1..rubyist_count).to_a.each do |i|
  table_name = "rubyist#{i}".to_sym
  DB.drop_table table_name if DB.table_exists?(table_name)
  DB.create_table table_name do
    primary_key :id
    String :name
    String :code
    Integer :age
  end
end

(1..programmers_count).to_a.each do |i|
  table_name = "programmers#{i}".to_sym
  DB.drop_table table_name if DB.table_exists?(table_name)
  DB.create_table table_name do
    primary_key :id
    String :name
    String :skill
    Integer :years
    (1..rubyist_count).to_a.each do |j|
      Integer "rubyist#{j}_id"
    end
  end
end

(1..rubyist_count).to_a.each do |i|
  items = DB["rubyist#{i}".to_sym]
  rubyist_count.times do
    n = (1..99).to_a.sample
    items.insert(name: "约翰-麦卡锡#{n}", code: "rb_#{n}", age: (11..39).to_a.sample)
    items.insert(name: "Guido van Rossum#{n}", code: "rb_#{n}", age: (11..39).to_a.sample)
    items.insert(name: "丹尼斯-里奇#{n}", code: "rb_#{n}", age: (11..39).to_a.sample)
    items.insert(name: "DHH#{n}", code: "rb_#{n}", age: (11..39).to_a.sample)
    items.insert(name: "Linus#{n}", code: "rb_#{n}", age: (11..39).to_a.sample)
    items.insert(name: "Matz#{n}", code: "rb_#{n}", age: (11..39).to_a.sample)
    items.insert(name: "Ken Thompson#{n}", code: "rb_#{n}", age: (11..39).to_a.sample)
  end
end

(1..programmers_count).to_a.each do |i|
  items = DB["programmers#{i}".to_sym]
  (1..2).to_a.sample.times do
    h = {}
    (1..rubyist_count).to_a.each do |j|
      h.merge!("rubyist#{j}_id" => (1..rubyist_count).to_a.sample)
    end

    items.insert({ name: "Nolan#{(1..100).to_a.sample}", skill: "Rails", years: (1..25).to_a.sample }.merge(h))
    items.insert({ name: "Layla#{(1..100).to_a.sample}", skill: "AngularJS", years: (1..25).to_a.sample }.merge(h))
    items.insert({ name: "Jackson#{(1..100).to_a.sample}", skill: "Sinatra", years: (1..25).to_a.sample }.merge(h))
    items.insert({ name: "Frank#{(1..100).to_a.sample}", skill: "Bootstrap, ", years: (1..25).to_a.sample }.merge(h))
    items.insert({ name: "朱蒂#{(1..100).to_a.sample}", skill: "JQuery, Grape", years: (1..25).to_a.sample }.merge(h))
  end
end
