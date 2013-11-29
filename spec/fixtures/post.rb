ActiveRecord::Base.connection.create_table(:posts, force: true) do |t|
  t.string :title
end
ActiveRecord::Base.connection.create_table(:comments, force: true) do |t|
  t.string :message
end


class Post < ActiveRecord::Base
  predicate :starts_with do |column, value|
    column.matches("#{value}%")
  end
end

class Comment < ActiveRecord::Base
end