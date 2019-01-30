Gem::Specification.new do |gem|
  gem.name = 'db_admin'
  gem.version = '0.1.1'
  gem.date = '2019-01-30'
  gem.summary = "A Web UI for database admin!"
  gem.description = "A Web UI to manage databases. Support PostgreSQL, MySQL, SQLite, Oracle, MS-SQL, etc."
  gem.authors  = ["Lane Zhang"]
  gem.email = 'zjloveztt@gmail.com'
  gem.homepage = 'https://github.com/gazeldx/db_admin'
  gem.license = 'MIT'

  gem.files = Dir.glob("lib/**/*") + %w(README.md)
  gem.executables = ['db_admin']

  gem.add_runtime_dependency('sinatra')
  gem.add_runtime_dependency('sequel')
end