require 'sequel'
require 'json'
require 'sinatra'
# require 'sinatra/reloader' if development? #NOTICE: If you want to modify something for your customized purpose, you need remove the "#" of this line. And also comment off the line of "gem 'sinatra-reloader'" in Gemfile. Then you can see the result immediately. Otherwise you need to stop the WEBrick and run `$ ruby db_admin.rb` again.


DB = RURY_DB_ADMIN = Sequel.sqlite('ruby_db_admin.db') # ./ruby_db_admin.db
# DB = Sequel.connect('postgres://user:password@host:port/database_name')
# DB = Sequel.connect('postgres://lane:password@localhost:5432/ucweb_development')

enable :sessions

get '/' do
  erb :index
end

get '/tables/:table_name' do
  @schema = DB.schema(params[:table_name].to_sym)

  @dataset = DB[params[:table_name].to_sym].extension(:pagination)\
               .paginate((params[:page] || 1).to_i, 50, record_count=nil)

  erb :table
end

post '/tables/:table_name/insert_one' do
  values = params[:values].gsub(/\r\n/, '\n').gsub(/(\n)+/, ',')
  values = values[0..values.size - 2] if values[values.size - 1] == ','

  id = DB[params[:table_name].to_sym].insert(eval("{#{values}}"))

  content_type :json
  { id: id }.to_json
end

delete '/tables/:table_name/delete_one/:id' do
  DB[params[:table_name].to_sym].where(id: params[:id]).delete

  content_type :json
  { id: params[:id] }.to_json
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

put '/tables/:table_name/:id/:column_name' do
  DB[params[:table_name].to_sym].where(id: params[:id]).update(params[:column_name].to_sym => params[:new_value])

  content_type :json
  { new_value: (params[:column_name] == 'id' ? params[:new_value] : DB[params[:table_name].to_sym].first(id: params[:id])[params[:column_name].to_sym]),
    td_id:     params[:td_id]
  }.to_json
end

helpers do
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
      "#{string_value[0..30]}<a href='#' onclick='show_full_content.call(this)' title='Click to show full content'>...</a>"
    else
      string_value
    end
  end
end