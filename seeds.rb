# This file is used for create the database ./ruby_db_admin.db
require 'sequel'

RUBY_DB_ADMIN = Sequel.sqlite('ruby_db_admin.db')

(1..12).to_a.each do |i|
  RUBY_DB_ADMIN.drop_table "rubyist#{i}"
  RUBY_DB_ADMIN.create_table "rubyist#{i}" do
    primary_key :id
    String :name
    String :code
    Integer :age
  end
end

(1..50).to_a.each do |i|
  RUBY_DB_ADMIN.drop_table "programmers#{i}"
  RUBY_DB_ADMIN.create_table "programmers#{i}" do
    primary_key :id
    String :name
    String :skill
    Integer :years
    (1..12).to_a.each do |j|
      Integer "rubyist#{j}_id"
    end
  end
end

(1..12).to_a.each do |i|
  items = RUBY_DB_ADMIN["rubyist#{i}".to_sym]
  12.times do
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

(1..50).to_a.each do |i|
  items = RUBY_DB_ADMIN["programmers#{i}".to_sym]
  (1..2).to_a.sample.times do
    h = {}
    (1..12).to_a.each do |j|
      h.merge!("rubyist#{j}_id" => (1..12).to_a.sample)
    end

    items.insert({ name: "Nolan#{(1..100).to_a.sample}", skill: "Rails", years: (1..25).to_a.sample }.merge(h))
    items.insert({ name: "Layla#{(1..100).to_a.sample}", skill: "AngularJS", years: (1..25).to_a.sample }.merge(h))
    items.insert({ name: "Jackson#{(1..100).to_a.sample}", skill: "Sinatra", years: (1..25).to_a.sample }.merge(h))
    items.insert({ name: "Frank#{(1..100).to_a.sample}", skill: "Bootstrap, ", years: (1..25).to_a.sample }.merge(h))
    items.insert({ name: "朱蒂#{(1..100).to_a.sample}", skill: "JQuery, Grape", years: (1..25).to_a.sample }.merge(h))
  end
end
