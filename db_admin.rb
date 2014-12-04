require 'sequel'
require 'sinatra'
# require 'sinatra/reloader' if development? #NOTICE: If you want to modify something for your customized purpose, you need remove the "#" of this line. Then you can see the result immediately. Otherwise you need to stop the WEBrick and run `$ ruby db_admin.rb` again.


RURY_DB_ADMIN = Sequel.sqlite('ruby_db_admin.db')
DB = RURY_DB_ADMIN
# DB = Sequel.connect('sqlite://ruby_db_admin.db') # ./ruby_db_admin.db
# DB = Sequel.connect('postgres://user:password@host:port/database_name')
# DB = Sequel.connect('postgres://lane:password@localhost:5432/ucweb_development')

enable :sessions

get '/' do
  erb :index
end

get '/tables/:table_name' do
  @dataset = DB[params[:table_name].to_sym]
  # @dataset = DB[params[:table_name].to_sym].extension(:pagination)\
  #              .paginate((params[:page] || 1).to_i, 10, record_count=nil)
  erb :table
end

delete '/tables/:table_name/truncate' do
  DB[params[:table_name].to_sym].truncate

  session[:notice] = "#{params[:table_name].to_sym.inspect} truncated!"
  redirect back
end

delete '/tables/:table_name/delete_all' do
  DB[params[:table_name].to_sym].delete

  session[:notice] = "All #{params[:table_name].to_sym.inspect} data deleted!"
  redirect back
end

delete '/tables/:table_name/drop' do
  DB.drop_table(params[:table_name].to_sym)

  session[:notice] = "Table #{params[:table_name].to_sym.inspect} dropped!"
  redirect '/'
end

helpers do
  def say_hello(value)
    "#{DB.tables.inspect}hello #{value}"
  end

  def notice_info
    result = ''
    if session[:notice]
      result = "<div class='alert alert-success' role='alert'>#{session[:notice]}</div>"
      session[:notice] = nil
    end
    result
  end

  def long_string_become_short(string_value)
    if string_value.to_s.size > 33
      "#{string_value[0..30]}...todo as link"
    else
      string_value
    end
  end
end