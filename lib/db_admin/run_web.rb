require_relative '../db_admin'

module DBAdmin
  class Web
    # Uncomment the line below to direct connect to a database.
    # DB = Sequel.connect({ adapter: 'postgres', # 'adapter' can be 'postgres', 'mysql2', 'sqlite', 'oracle', etc.
    #                       host: 'hostname_or_ip',
    #                       database: 'your_database_name',
    #                       user: 'user',
    #                       password: '' }); DBs << DB
  end
end

DBAdmin::Web.run!
