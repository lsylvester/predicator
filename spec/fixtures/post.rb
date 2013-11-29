ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS 'posts'")
ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS 'comments'")

ActiveRecord::Base.connection.create_table(:posts) do |t|
  t.string :title
end
ActiveRecord::Base.connection.create_table(:comments) do |t|
  t.string :message
end


class Post < ActiveRecord::Base
  predicate :starts_with do |column, value|
    column.matches("#{value}%")
  end
end

class Comment < ActiveRecord::Base
end