require 'active_record'
require 'active_record/column_where_chain'
require 'pry'
root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "#{root}/db/test.db"
)

require 'fixtures/post'
