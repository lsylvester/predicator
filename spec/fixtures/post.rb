ActiveRecord::Base.connection.create_table(:posts, force: true) do |t|
  t.string :title
end

class Post < ActiveRecord::Base
  predicate :starts_with do |column, value|
    column.matches("#{value}%")
  end
end