require_relative 'connection'
require_relative 'models'

# Test database connection
ActiveRecord::Base.connection.execute("SELECT 1")