Gem::Specification.new do |gem|
  gem.name = 'db_admin'
  gem.version = '0.1.0'
  gem.date = '2019-01-29'
  gem.summary = "A Web for database admin!"
  gem.description = "A Web to manage databases. Support PostgerSQL, MySQL, SQLite, Oracle, MS-SQL, SQLAnywhere, DB2, Access, etc.
"
  gem.authors  = ["Lane Zhang"]
  gem.email = 'zjloveztt@gmail.com'
  gem.homepage = 'https://github.com/gazeldx/ruby-db-admin'
  gem.license = 'MIT'

  gem.files = Dir.glob("lib/**/*") + %w(README.md)
  gem.executables = ['db_admin']

  gem.add_runtime_dependency('sinatra')
  gem.add_runtime_dependency('sequel')
end