ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS 'posts'")
ActiveRecord::Base.connection.create_table(:posts) do |t|
  t.string :title
end

class Post < ActiveRecord::Base
end